class AppointmentsController < ApplicationController
    
  skip_before_action :authenticate_user!, only: [:new, :create, :update]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :assign_doctor, :cancel]
  
  def new
    @appointment = Appointment.new
    if params[:procedure_id]
      @appointment.procedure_id = params[:procedure_id]
    end
      
    @appointment.save(validate: false)
    redirect_to appointment_step_path(@appointment, Appointment.appointment_steps.first)
  end
  

  
  def index 
     @appointments = Appointment.active.all 
  end
  
  def edit
    
  end
  
  def update
    if @appointment.update(appointment_params)
      flash[:notice] = "Appointment was updated successfully."
      redirect_to appointment_path(@appointment)
    else
      render 'edit', appointment: @appointment
    end    
  end
  
  def destroy 
      @appointment.destroy
      redirect_to appointments_path
  end
  
  def cancel
    if @appointment.status == 'active'
      @appointment.status = 'cancelled'
      if @appointment.save
        flash[:notice] = "Appointment was cancelled successfully"
        redirect_to appointments_path(status:'cancelled')
      else
        flash[:notice] = "Appointment was not saved due to an error"
        redirect_to appointments_path
      end
    else
      @appointment.status = 'active'
      if @appointment.save
        flash[:notice] = "Appointment cancellation reversal was successful"
        redirect_to appointments_path
      else
        flash[:notice] = "Appointment was not saved due to an error"
        redirect_to appointments_path(status:'cancelled')
      end
    end
  end
  
  def assign_doctor
    
  end
  
  def datatable
    respond_to do |format|
      format.html
      format.json { render json: AppointmentDatatable.new(params, view_context: view_context, current_user: current_user, status: params[:status]) }
    end
  end
  
  
  private
  
  def appointment_params
     params.require(:appointment).permit(:first_name, :last_name, :date_of_birth, :gender, :phone, :email, :date, :time, 
      :appointment_number, :procedure_id, :user_id)
  end

  def set_appointment
      @appointment = Appointment.find(params[:id])
  end
    
end

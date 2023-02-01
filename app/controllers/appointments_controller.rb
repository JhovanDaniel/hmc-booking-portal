class AppointmentsController < ApplicationController
    
    skip_before_action :authenticate_user!, only: [:new, :create, :update]
    before_action :set_appointment, only: [:show, :edit, :update, :destroy, :assign_doctor]
    
    def new
      @appointment = Appointment.new
      if params[:procedure_id]
        @appointment.procedure_id = params[:procedure_id]
      end
        
      @appointment.save(validate: false)
      redirect_to appointment_step_path(@appointment, Appointment.appointment_steps.first)
    end
    

    
    def index 
       @appointments = Appointment.all 
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
    
    def assign_doctor
      
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

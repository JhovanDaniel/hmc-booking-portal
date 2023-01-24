class AppointmentsController < ApplicationController
    
    skip_before_action :authenticate_user!, only: [:new, :create, :update]
    before_action :set_appointment, only: [:show, :edit, :update, :destroy, :assign_doctor]
    
    def new
        @appointment = Appointment.new
    end
    
    def create
        @appointment = Appointment.new(appointment_params)
        if @appointment.save(validate: false)
            flash[:notice] = "Appointment was created successfully."
            redirect_to new_payment_path
        else
           render 'new' 
        end
    end
    
    def index 
       @appointments = Appointment.all 
    end
    
    def edit
      
    end
    
    def update
      if @appointment.update(appointment_params)
        flash[:notice] = "Appointment was created successfully."
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

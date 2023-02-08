class Appointment::StepsController < ApplicationController
  include Wicked::Wizard
  steps *Appointment.appointment_steps
  
  skip_before_action :authenticate_user!, only: %i[show update]
  before_action :set_appointment, only: %i[show update]
  
  def show
    render_wizard
  end

  def update
    @appointment.update(appointment_params(step))
    render_wizard @appointment
  end
  
  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end
  
  def appointment_params(step)
    permitted_attributes = case step
      when "appointment_information"
        [:first_name, :last_name, :date_of_birth, :gender, :phone, :email, :procedure_id, :user_id]
      when "timeslots"
        [:date, :time]
      end
    params.require(:appointment).permit(permitted_attributes).merge(appointment_step: step)
  end
  
end

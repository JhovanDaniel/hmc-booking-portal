class ResultMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.result_mailer.send_results.subject
  #
  def send_results(appointment)
    @appointment = appointment
    attachments['HMC-logo.png'] = File.read('app/assets/images/HMC-logo.png')
  
  
    mail(
      to: email_address_with_name(@appointment.email, @appointment.first_name),
      subject: 'HMC Appointment Confirmation '+@appointment.appointment_number
      )
  end
end

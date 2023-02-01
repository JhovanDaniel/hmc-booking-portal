# Preview all emails at http://localhost:3000/rails/mailers/result_mailer
class ResultMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/result_mailer/send_results
  def send_results
    ResultMailer.send_results
  end

end

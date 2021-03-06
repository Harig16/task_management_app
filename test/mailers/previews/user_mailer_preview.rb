# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/reminder_mail
  def reminder_mail
    task = Task.first
    UserMailer.reminder_mail(task)
  end

end

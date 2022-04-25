class UserMailer < ApplicationMailer

  default from: 'no-reply@example.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reminder_mail.subject
  #
  def reminder_mail(task)
    @user = task.user
    @task = task
    @greeting = "Hello"
    mail to: @user.email, subject: "#{@task.title} - Deadline Task"
  end
end

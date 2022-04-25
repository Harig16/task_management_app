namespace :reminder_email do
  desc 'Sends an email to user when task reach deadline'
  task deadline: :environment do
    Task.all.each do |task|
      if task.status == "progress" && (task.deadline - 1.day).strftime("%F") == Date.today.strftime("%F")
        UserMailer.reminder_mail(task).deliver_now
      end
    end
  end
end
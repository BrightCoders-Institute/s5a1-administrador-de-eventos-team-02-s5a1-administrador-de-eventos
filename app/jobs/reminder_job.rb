# app/jobs/reminder_job.rb
class ReminderJob < ApplicationJob
  queue_as :default

  def perform(user_id, event_title, reminder_datetime)
    user = User.find(user_id)
    ReminderMailer.send_reminder(user.email, event_title, reminder_datetime).deliver_now
  end
end

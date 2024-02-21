# app/mailers/reminder_mailer.rb
class ReminderMailer < ApplicationMailer
  def send_reminder(user_email, event_title, reminder_datetime)
    @event_title = event_title
    @reminder_datetime = reminder_datetime

    mail(to: user_email, subject: "Recordatorio para el evento #{@event_title}")
  end
end

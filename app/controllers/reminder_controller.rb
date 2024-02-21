class RemindersController < ApplicationController
  def create
    user_id = current_user.id 
    message = params[:reminder][:message]

    # Llamar al Active Job
    ReminderJob.perform_later(user_id, message)

    redirect_to events_path, notice: 'Recordatorio creado exitosamente.'
  end
end

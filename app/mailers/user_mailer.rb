class UserMailer < ApplicationMailer
  def verification_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Verifica tu correo electrónico')
  end

   def reset_password_email(user)
    @user = user
    @url  = edit_user_password_url(@user.reset_password_token)
    mail(to: @user.email, subject: 'Cambia tu contraseña')
  end
end

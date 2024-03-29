class UserMailer < ApplicationMailer
  def verification_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Verifica tu correo electrónico')
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_user_password_url(reset_password_token: @user.reset_password_token)
    mail(to: @user.email, subject: 'Cambia tu contraseña') do |format|
      format.html { render 'reset_password_email' }
    end
  end
end

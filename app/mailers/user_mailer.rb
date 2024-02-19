class UserMailer < ApplicationMailer
  def verification_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Verify your email address')
  end
end

class UserMailer < ApplicationMailer
  def verification_email
    pp params
    @user = params[:user]
    mail(to: @user.email, subject: 'Verify your email address')
  end
end

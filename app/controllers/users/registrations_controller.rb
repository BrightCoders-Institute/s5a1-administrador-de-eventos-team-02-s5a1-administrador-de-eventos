# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: %i[create update]

  def new
    super
  end

  def create
    super do |resource|
      if resource.persisted?
        @user = resource
        UserMailer.with(user: @user).verification_email.deliver_later
        flash[:notice] = 'Se ha enviado un correo de verificación a tu dirección de correo electrónico.'
      end
    end
  end

  def edit
    @user = current_user
    super
  end

  def update
    super
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end
end

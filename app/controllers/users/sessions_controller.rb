# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  attr_accessible :name, :email, :password, :password_confirmation, :current_password


  def new
  end

  def create
    super do |resource|
      BackgroundWorker.trigger(resource)
    end
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end

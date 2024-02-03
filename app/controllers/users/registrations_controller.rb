# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]

  def new
    super
  end

  def edit
    @user = current_user
    super
  end


  def update
    super
  end
end

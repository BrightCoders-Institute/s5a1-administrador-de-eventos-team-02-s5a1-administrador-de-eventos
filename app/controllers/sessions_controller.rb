class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to events_path, notice: 'Sesión iniciada exitosamente.'
    else
      flash.now[:alert] = 'Correo electrónico o contraseña incorrectos.'
      render :new
    end
  end
end

class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  helper_method :current_user

  def index
    @eventos = Event.all
  end

  def show
    @evento
  end

  def edit
  end

  def update
    if @evento.update(event_params)
      redirect_to @evento, notice: 'Evento editado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @evento.destroy
    redirect_to events_path, notice: 'Evento eliminado exitosamente.'
  end

  def new
    @evento = Event.new
  end

   def create
    @evento = Event.new(event_params)

    if @evento.save
      redirect_to events_path, notice: 'Evento creado exitosamente.'
    else
      render :new
    end
  end 

  private
  def set_event
    @evento = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:alert] = 'Debes iniciar sesión para acceder a esta página'
      redirect_to login_path
    end
  end

end

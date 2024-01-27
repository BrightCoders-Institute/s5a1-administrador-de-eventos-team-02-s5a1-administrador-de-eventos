class EventsController < ApplicationController
   def index
    @eventos = Event.all
  end

  def show
    @evento = Event.find(params[:id])
  end

  def new
    @evento = Event.new
  end

   def create
    @evento = Event.new(event_params)

    if @evento.save
      redirect_to events_path, notice: 'Evento creado exitosamente'
    else
      render :new
    end
  end

  private
  def event_params
    params.require(:event).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo)
  end

end

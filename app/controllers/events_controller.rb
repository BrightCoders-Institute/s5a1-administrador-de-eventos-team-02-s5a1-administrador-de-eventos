# frozen_string_literal: true

# EventsController
#
# Controlador para gestionar eventos.
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @eventos = Event.all
  end

  def show
    @evento
  end

  def edit; end

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
    @evento = current_user.events.new
  end

  def create
    @evento = current_user.events.new(event_params)

    if @evento.save
      redirect_to events_path, notice: 'Evento creado exitosamente.'
    else
      render :new
    end
  end

  def my_events
    @eventos = current_user.events
  end

  def edit_image
    @evento = Event.find(params[:id])
  end

  def update_image
    @event = Event.find(params[:id])
    @event.image.purge # Eliminar la imagen existente
    @event.image.attach(params[:event][:image]) # Adjuntar la nueva imagen

    redirect_to @event, notice: 'Imagen actualizada correctamente'
  end

  def delete_image
    @event = Event.find(params[:id]) # Utilizar params[:id] en lugar de params[:event_id]
    @event.image.purge # Eliminar la imagen
    redirect_to @event, notice: 'Imagen eliminada correctamente.'
  end

  private

  def set_event
    @evento = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo, :image)
  end
end

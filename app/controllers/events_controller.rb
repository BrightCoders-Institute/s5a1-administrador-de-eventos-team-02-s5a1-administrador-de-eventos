# frozen_string_literal: true

# EventsController
#
# Controlador para gestionar eventos.
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

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
    params.require(:event).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo, :image)
  end
end

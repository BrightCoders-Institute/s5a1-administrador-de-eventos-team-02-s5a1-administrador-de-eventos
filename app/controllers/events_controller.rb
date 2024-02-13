# frozen_string_literal: true

# EventsController
#
# Controlador para gestionar eventos.
class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    if params[:tipo_evento].present? || params[:fecha_inicio].present? || params[:fecha_final].present?
      @eventos = filtrar_eventos(params[:tipo_evento], params[:fecha_inicio], params[:fecha_final])
    else
      @eventos = Event.all
    end
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

  def events_filters
    @filtro = Filtro.new
    @eventos = Event.all
  end

  private

  def filtrar_eventos(tipo_evento, fecha_inicio, fecha_final)
    eventos = Event.all

    eventos = eventos.where(tipo_de_eventos: tipo_evento) if tipo_evento.present?
    eventos = eventos.where('fecha >= ?', fecha_inicio.to_date) if fecha_inicio.present?
    eventos = eventos.where('fecha <= ?', fecha_final.to_date) if fecha_final.present?

    eventos
  end

  def set_event
    @evento = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo, :tipo_de_eventos, :image)
  end
end

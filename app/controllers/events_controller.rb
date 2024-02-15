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

  def events_filters
    if params[:tipo_de_eventos].present? || (params[:fecha_inicio].present? && params[:fecha_final].present?)
    @eventos = filtrar_eventos(params[:tipo_de_eventos], params[:fecha_inicio], params[:fecha_final]).paginate(page: params[:page], per_page: 5)
  else
    @eventos = Event.paginate(page: params[:page], per_page: 5)
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
      redirect_to events_filters_path, notice: 'Evento creado exitosamente.'
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

  def filtrar_eventos(tipo_de_eventos, fecha_inicio, fecha_final)
    eventos = Event.all

    eventos = eventos.where(tipo_de_eventos: tipo_de_eventos) if tipo_de_eventos.present?
    eventos = eventos.where(fecha: fecha_inicio.to_datetime.beginning_of_day..fecha_final.to_datetime.end_of_day) if fecha_inicio.present? && fecha_final.present?

    eventos
  end

  def set_event
    @evento = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo, :tipo_de_eventos, :image)
  end
end

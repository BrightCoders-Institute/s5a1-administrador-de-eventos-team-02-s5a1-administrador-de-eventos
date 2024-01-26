class EventController < ApplicationController
   def index
    @eventos = Event.all
  end

  def show
    @evento = Event.find(params[:id])
  end
end

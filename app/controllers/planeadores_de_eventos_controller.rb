class PlaneadoresDeEventosController < ApplicationController
  before_action :set_planeadores_de_evento, only: %i[ show edit update destroy ]

  # GET /planeadores_de_eventos or /planeadores_de_eventos.json
  def index
    @planeadores_de_eventos = PlaneadoresDeEvento.all
  end

  # GET /planeadores_de_eventos/1 or /planeadores_de_eventos/1.json
  def show
  end

  # GET /planeadores_de_eventos/new
  def new
    @planeadores_de_evento = PlaneadoresDeEvento.new
  end

  # GET /planeadores_de_eventos/1/edit
  def edit
  end

  # POST /planeadores_de_eventos or /planeadores_de_eventos.json
  def create
    @planeadores_de_evento = PlaneadoresDeEvento.new(planeadores_de_evento_params)

    respond_to do |format|
      if @planeadores_de_evento.save
        format.html { redirect_to planeadores_de_evento_url(@planeadores_de_evento), notice: "Planeadores de evento was successfully created." }
        format.json { render :show, status: :created, location: @planeadores_de_evento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @planeadores_de_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planeadores_de_eventos/1 or /planeadores_de_eventos/1.json
  def update
    respond_to do |format|
      if @planeadores_de_evento.update(planeadores_de_evento_params)
        format.html { redirect_to planeadores_de_evento_url(@planeadores_de_evento), notice: "Planeadores de evento was successfully updated." }
        format.json { render :show, status: :ok, location: @planeadores_de_evento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @planeadores_de_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planeadores_de_eventos/1 or /planeadores_de_eventos/1.json
  def destroy
    @planeadores_de_evento.destroy

    respond_to do |format|
      format.html { redirect_to planeadores_de_eventos_url, notice: "Planeadores de evento was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planeadores_de_evento
      @planeadores_de_evento = PlaneadoresDeEvento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def planeadores_de_evento_params
      params.require(:planeadores_de_evento).permit(:titulo, :descripcion, :fecha, :ubicacion, :costo)
    end
end

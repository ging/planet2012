# == Qué hace este controlador
# El controlador de tipos gestiona todo lo relacionado con la creación, edición y eliminación de tipos. 
# Como las visitas se renderizan con los viajes, se controla indirectamente qué usuario realiza estas acciones.
class VisitsController < ApplicationController
  
  # Método que muestra todos las visitas. Rutas:
  # * GET /visits
  # * GET /visits.json
  def index
    @visits = Visit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  # Método que muestra la visita seleccionada. Rutas:
  # * GET /visits/1
  # * GET /visits/1.json
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  # Método que permite modificar una nueva visita. Rutas:
  # * GET /visits/new
  # * GET /visits/new.json
  def new
    @visit = Visit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit }
    end
  end

  # Método que permite editar la visita seleccionada. Ruta:
  # * GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
  end

  # Método que crea la nueva visita. Rutas:
  # * POST /visits
  # * POST /visits.js
  # * POST /visits.json
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.html { redirect_to @visit.trip, notice: 'Visit was successfully created.' }
        format.js
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { render action: "new" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que actualiza la visita editada. Rutas:
  # * PUT /visits/1
  # * PUT /visits/1.json
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to @visit.trip, notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que permite eliminar una visita. Rutas:
  # * DELETE /visits/1
  # * DELETE /visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to @visit.trip }
      format.json { head :no_content }
    end
  end
end

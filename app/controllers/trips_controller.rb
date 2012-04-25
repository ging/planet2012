# == Qué hace este controlador
# El controlador de trips gestiona todo lo relacionado con la creación, edición y eliminación de viajes. 
# Trabaja con Devise para identificar cada viaje con el usuario que lo creó y con visits, que componen un viaje.
# Tiene un filtro para ejecutar las acciones sólo si antes se ha iniciado sesión. Este filtro no afecta a las acciones index y show.

class TripsController < ApplicationController

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # Método que muestra todos los viajes. Rutas:
  # * GET /trips
  # * GET /trips.json
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # Método que muestra el viaje seleccionado. Rutas:
  # * GET /trips/:id
  # * GET /trips/:id.json
  def show
    @trip = Trip.find(params[:id])
    @visit = @trip.visits.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # Método que permite modificar un nuevo viaje. Rutas:
  # * GET /trips/new
  # * GET /trips/new.json
  def new
    @trip = current_user.trips.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # Método que permite editar el viaje seleccionado. Ruta:
  # * GET /trips/:id/edit
  def edit
    @trip = current_user.trips.find(params[:id])
  end

  # Método que crea el nuevo viaje. Rutas:
  # * POST /trips
  # * POST /trips.json
  def create
    @trip = current_user.trips.build(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que actualiza el viaje editado. Rutas:
  # * PUT /trips/:id
  # * PUT /trips/:id.json
  def update
    @trip = current_user.trips.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que permite eliminar un viaje. Rutas:
  # * DELETE /trips/:id
  # * DELETE /trips/:id.json
  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end

#TripsController es la clase que aglutina los métodos 
#necesarios para tratar con los viajes creados
#
class TripsController < ApplicationController

  
  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  # método que muestra todos los viajes disponibles
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # método que muestra un determinado viaje
  def show
    @trip = Trip.find(params[:id])
    @visit = @trip.visits.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # método que crea un nuevo viaje vacío
  def new
    @trip = current_user.trips.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # método para editar un viaje
  def edit
    @trip = current_user.trips.find(params[:id])
  end

  # método para crear un nuevo viaje asociado al usuario actual
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

  # método para actualizar un viaje determinado
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

  # método para eliminar un viaje determinado
  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end

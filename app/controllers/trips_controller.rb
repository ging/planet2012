class TripsController < ApplicationController
  
  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]
  
  # GET /trips
  # GET /trips.json
  # Obtiene todos los viajes y los renderiza en la misma vista
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  # Muestra el viaje cuyo id se pasa como parámetro.
  def show
    @trip = Trip.find(params[:id])
    @visit = @trip.visits.build

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  # Muestra un formulario para añadir un nuevo viaje a la web.
  def new
    @trip = current_user.trips.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  # Muestra una vista para editar el viaje cuyo id se pasa como parámetro.
  def edit
    @trip = current_user.trips.find(params[:id])
  end

  # POST /trips
  # POST /trips.json
  # Muestra una vista con un mensaje de confirmación y el viaje creado.
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

  # PUT /trips/1
  # PUT /trips/1.json
  # Muestra una vista para editar los parámetros del viaje.
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

  # DELETE /trips/1
  # DELETE /trips/1.json
  # Elimina el viaje que se pasa como parámetro.
  def destroy
    @trip = current_user.trips.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
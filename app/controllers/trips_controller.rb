class TripsController < ApplicationController

  # authenticate_user! ejecuta acción sólo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = current_user.trips.build # cambiar Trip.new por current_user.trips.build -- crea viaje vacio asociado a current user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = current_user.trips.find(params[:id]) # cambiar Trip por current_user.trips -- busca solo en sitios asociados a current_user
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = current_user.trips.build(params[:trip]) # cambiar Trip.new por current_user.trips.build -- Asigna solo si sitio asociado a current_user

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
  def update
    @trip = current_user.trips.find(params[:id]) # cambiar Trip por current_user.trips -- busca solo en sitios asociados a current_user

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
  def destroy
    @trip = current_user.trips.find(params[:id]) # cambiar Trip por current_user.trips -- busca solo en sitios asociados a current_user
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end

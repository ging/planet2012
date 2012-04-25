class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.json
  # Muestras las visitas de un viaje.
  def index
    @visits = Visit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /visits/1
  # GET /visits/1.json
  # Muestra la visita cuyo id se pasa como parámetro.
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/new
  # GET /visits/new.json
  # Crear una nueva visita.
  def new
    @visit = Visit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit }
    end
  end

  # GET /visits/1/edit
  # Editar una visita cuyo id se pasa como parámetro.
  def edit
    @visit = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.json
  # Muestra la nueva visita creada con un mensaje de confirmación.
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

  # PUT /visits/1
  # PUT /visits/1.json
  # Actualiza los parámetros de una visita y muestra mensaje de confirmación.
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

  # DELETE /visits/1
  # DELETE /visits/1.json
  # Eliminar una visita cuyo id se pasa como parámetro.
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to @visit.trip }
      format.json { head :no_content }
    end
  end
end

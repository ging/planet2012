#VisitsController es la clase que aglutina los métodos 
#necesarios para tratar con las visitas a un determinado lugar
class VisitsController < ApplicationController

  
  #método que muestra todas las visitas
  def index
    @visits = Visit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  #método que muestra las visitas de un determinado lugar
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end

  #método que crea una nueva visita vacía
  def new
    @visit = Visit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @visit }
    end
  end

  # método para editar visitas
  def edit
    @visit = Visit.find(params[:id])
  end

  # método que crea una visita y la asocia a un lugar determinado
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

  # método para actualizar las visitas de un lugar
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

  # método que elimina las visitas de un lugar
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to @visit.trip }
      format.json { head :no_content }
    end
  end
end

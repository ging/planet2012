#==Controlador de tipos

class TypesController < ApplicationController
  # GET /types
  # Muestra una lista de tipos
  def index
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end
  
  # Muestra una lista de tipos ordenados
  def ordered_index
    @types = Type.find(:all, :order => :name)

    respond_to do |format|
		
      format.html { render action: "index" }
      format.json { render json: @types }
    end
  end

  # GET /types/1
  # Muestra un tipo detalladamente
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end

  # GET /types/new
  # Crea un nuevo tipo
  def new
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # Edita un tipo
  def edit
    @type = Type.find(params[:id])
  end

  # POST /types
	# Crea un nuevo sitio
  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type, notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created, location: @type }
      else
        format.html { render action: "new" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /types/1
  # Actualiza un tipo
  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        format.html { redirect_to @type, notice: 'Type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1
  # Elimina un sitio
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end
end

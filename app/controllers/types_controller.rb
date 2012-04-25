# == Qué hace este controlador
# El controlador de tipos gestiona todo lo relacionado con la creación, edición y eliminación de tipos. 
# Cualquier usuario puede realizar acciones sobre los tipos.
class TypesController < ApplicationController
  
  # Método que muestra todos los tipos. Rutas:
  # * GET /types
  # * GET /types.json
  def index
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  # Método que muestra el tipo seleccionado. Rutas:
  # * GET /types/:id
  # * GET /types/:id.json
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end

  # Este método define una acción que muestra todos los tipos por orden alfabético. Rutas:
  # * GET /types/ordered_index
  # * GET /types/ordered_index.json
  def ordered_index
    @types = Type.find(:all, :order => :name) 

    respond_to do |format|
      format.html # ordered_index.html.erb
      format.json { render json: @types }
    end
  end

  # Método que permite modificar un nuevo tipo. Rutas:
  # * GET /types/new
  # * GET /types/new.json
  def new
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  # Método que permite editar el tipo seleccionado. Ruta:
  # * GET /types/:id/edit
  def edit
    @type = Type.find(params[:id])
  end

  # Método que crea el nuevo tipo. Rutas:
  # * POST /types
  # * POST /types.json
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

  # Método que actualiza el tipo editado. Rutas:
  # * PUT /types/:id
  # * PUT /types/:id.json
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

  # Método que permite eliminar un tipo. Rutas:
  # * DELETE /types/:id
  # * DELETE /types/:id.json
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end
end

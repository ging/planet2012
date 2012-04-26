#TypesController es la clase que aglutina los métodos 
#necesarios para tratar con las tipos de lugares del sistema
#
class TypesController < ApplicationController


#método que muestra todos los tipos disponibles
  def index
    @types = Type.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @types }
    end
  end

  #método qeu muestra un determinado tipo creado
  def show
    @type = Type.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type }
    end
  end

  #método que crea un nuevo tipo vacío
  def new
    @type = Type.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type }
    end
  end

  #método que edita un tipo creado anteriormente
  def edit
    @type = Type.find(params[:id])
  end

  #método que crea nuevo un tipo determinado
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

  # método que actualiza un tipo creado previamente
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

  # método para eliminar un tipo existente
  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      format.html { redirect_to types_url }
      format.json { head :no_content }
    end
  end


#método que devuelve los tipos ordenados alfabéticamente

def ordered_index

    @types=Type.find(:all, :order => :name) 

  respond_to do |format|
    format.html #index.html.erb
    format.json { render json: @types}
end

end

end

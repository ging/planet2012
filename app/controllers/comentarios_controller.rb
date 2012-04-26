#ComentariosController es la clase que aglutina los métodos 
#necesarios para tratar con los comentarios creados en un determinado sitio
#
class ComentariosController < ApplicationController

  

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # Método que devuelve todos los comentarios existentes
  def index

    @comentarios=Comentario.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comentarios }
    end
  end

  #método que muestra los comentarios correspondientes a un determinado sitio
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end

  # método que crea un nuevo comentario "vacío"
  def new
    @comentario = Comentario.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

  #método que se emplea para editar un nuevo comentario
  def edit
    @comentario = Comentario.find(params[:id])  
  end

  #método que crea un nuevo comentario asociado a un determinado sitio
  def create
    @site=Site.find(params[:site_id])
    @comentario=@site.comentarios.create(params[:comentario])
    @comentario.user_id=current_user.id
    
    
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario, notice: 'Comentario was successfully created.' }
        format.json { render json: @comentario, status: :created, location: @comentario }
      else
        format.html { render action: "new" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  #método empleado para actualizar un comentario
  def update
    @comentario = current_user.comentarios.find(params[:id])  
    
    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  #método para eliminar un comentario determinado
  def destroy
    @comentario = current_user.comentarios.find(params[:id]) 
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to @comentario, notice: 'Comentario was successfully destroyed.' }
        format.json { render json: @comentario, status: :created, location: @comentario }
    end
  end
end
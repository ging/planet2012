class ComentariosController < ApplicationController
  # GET /comentarios
  # GET /comentarios.json
  before_filter :authenticate_user!, :except => [:index,:show]
   def index
    



      @comentarios = Site.find(params[:site_id]).comentarios  # path: /types/id/sites
      @comentario = current_user.comentarios.build
   

      
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
 
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.json
  def new
  
    @comentario = current_user.comentarios.build
     


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = current_user.comentarios.find(params[:id])
    
  end

  # POST /comentarios
  # POST /comentarios.json
  def create

    @comentario = current_user.comentarios.build(params[:comentario])#creamos un comentario con lo que nos pasa el formulario
    @comentario.site_id = params[:site_id]

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to site_comentarios_url, notice: 'Comentario was successfully created.' }
        format.json { render json: site_comentarios_url, status: :created, location: site_comentarios_url }
      else
        format.html { render action: "new" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.json
  def update
    @comentario = current_user.comentarios.find(params[:id]) #cogemos el comentario a actualizar
    
    
    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])#intentamos actualizar el comentario con el pasado por el formulario
        format.html { redirect_to site_comentarios_path(@comentario.site) , notice: 'Comentario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario = current_user.comentarios.find(params[:id])
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to site_comentarios_path(@comentario.site) }
      format.json { head :no_content }
    end
  end
end

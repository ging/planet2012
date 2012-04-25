# == Qué hace este controlador
# El controlador de comments gestiona todo lo relacionado con la creación, 
# edición y eliminación de comentarios. Trabaja con Devise para identificar 
# cada comentario con el usuario que lo creó.
# Tiene un filtro para ejecutar las acciones sólo si se ha iniciado sesión. 
# Este filtro no afecta a las acciones index y show.
class CommentsController < ApplicationController
  
  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # Método que muestra los comentarios asociados al sitio seleccionado. Rutas:
  # * GET /sites/:site_id/comments
  # * GET /sites/:site_id/comments.json
  def index
    @site = Site.find(params[:site_id])
    @comments = @site.comments
    @comment = current_user.comments.build if current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # Método que muestra el comentario seleccionado. Rutas:
  # * GET /comments/:comment_id
  # * GET /comments/:comment_id.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # Método que permite modificar un nuevo comentario asociado a un sitio. Rutas:
  # * GET /sites/:site_id/comments/new
  # * GET /sites/:site_id/comments/new.json
  def new
    @comment = current_user.comments.build
    @site = Site.find(params[:site_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # Método que permite editar el comentario seleccionado. Ruta:
  # * GET /comments/:id/edit
  def edit
    @comment = current_user.comments.find(params[:id])
    @site = @comment.site
  end

  # Método que crea el nuevo comentario. Rutas:
  # * POST /comments
  # * POST /comments.js
  # * POST /comments.json
  def create
    @comment = current_user.comments.build(params[:comment])
    @site = @comment.site

    respond_to do |format|
      if @comment.save
        format.html { redirect_to site_path(@site), notice: 'Comment was successfully created.' }
        format.js
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que actualiza el comentario editado. Rutas:
  # * PUT /comments/:id
  # * PUT /comments/:id.json
  def update
    @comment = current_user.comments.find(params[:id])
    @site = @comment.site

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to site_path(@site), notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que permite eliminar un comentario. Rutas:
  # * DELETE /comments/:id
  # * DELETE /comments/:id.json
  def destroy
    @comment = current_user.comments.find(params[:id])
    site = @comment.site
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to site_path(site) }
      format.json { head :no_content }
    end
  end
end

class CommentsController < ApplicationController

    # Crear un comentario
	def create
    	@site = Site.find(params[:site_id])
    	@comment = @site.comments.create(params[:comment])
        @comment.user_id = current_user.id

        respond_to do |format|
            if @comment.save
                format.html { redirect_to @site, notice: 'Comentario creado' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
	end

    # Borrar un comentario
	def destroy
    	@site = Site.find(params[:site_id])
    	@comment = @site.comments.find(params[:id])
    	@comment.destroy
    	redirect_to site_path(@site)
	end

    # Editar un comentario
    def edit
        @site = Site.find(params[:site_id])
        @comment = @site.comments.find(params[:id])
    end

    # Controlador para actualizar un comentario
    def update
        @site = Site.find(params[:site_id])
        @comment = @site.comments.find(params[:id])

        respond_to do |format|
            if @comment.update_attributes(params[:comment])
                format.html { redirect_to @site, notice: 'Comentario actualizado' }
                format.json { head :no_content }
            else
                format.html { render action: "edit" }
                format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end

    # Para listar todos los comentarios de un usuario
    def index
        @user = User.find(params[:user_id])
    end

end

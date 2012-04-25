class CommentController < ApplicationController
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
end

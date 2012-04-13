class CommentsController < ApplicationController
  def index
    @site = Site.find(params[:site_id]) 
  end

  def edit
    @comment = current_user.comments.find(params[:id]) 
    @site = Site.find(params[:site_id]) 
  end

  def update
    @comment = current_user.comments.find(params[:id])
    @site = Site.find(params[:site_id]) 
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @site, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @site = Site.find(params[:site_id])
    @comment = @site.comments.create(params[:comment])
    @comment.user_id = current_user.id 
    
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @site, notice: 'Comment was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { redirect_to @site, notice: @comment.comment }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @site }
      format.json { head :no_content }
    end
  end

end

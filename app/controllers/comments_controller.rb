class CommentsController < ApplicationController
	def create
		@site = Site.find(params[:site_id])
		@comment = @site.comments.build(params[:comment])
		
		respond_to do |format|
      		if @comment.save
        		format.html { redirect_to @site, notice: 'Comment was successfully created.' }
      		else
        		format.html { redirect_to @site, notice: 'Comment error' }
      		end
    	end
	end
	def destroy
		@site = Site.find(params[:site_id])
		@comment = @site.comments.find(params[:id])
		@comment.destroy
		redirect_to site_path(@site)
	end
  def edit
    @site = Site.find(params[:site_id])
    @comment = @site.comments.find(params[:id])
  end
	def update
    	@site = Site.find(params[:site_id])
		@comment = @site.comments.find(params[:id])
    
    	respond_to do |format|
      		if @comment.update_attributes(params[:comment])
        		format.html { redirect_to @site}
      		else
        		format.html { render action: "edit" }
      		end
    	end
  	end
end

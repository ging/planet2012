class CommentsController < ApplicationController
  
  before_filter :authenticate_user!
  
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id]) 
    @site = Site.find(params[:site_id]) 
  end

  # POST /comments
  # POST /comments.json
  def create
	@site = Site.find(params[:site_id])
    @comment = @site.comments.create(params[:comment])
	@comment.user_id = current_user.id
	
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @site, notice: 'Comment was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { redirect_to @site}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  
  
  
  # PUT /comments/1
  # PUT /comments/1.json
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

  # DELETE /comments/1
  # DELETE /comments/1.json
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

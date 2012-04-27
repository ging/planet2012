class CommentsController < ApplicationController

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # GET /coments
  # GET /coments.json
  def index
        if params[:site_id].nil? or params[:site_id].empty?
      @comments = Comment.all            # path: /sites
      else
      @comments = Site.find(params[:site_id]).comments  # path: /sites/id/comentarios
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end
  # POST /coments
  # POST /coments.json
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

  # Nos permite crear un nuevo comentario
  # GET /coments/new
  # GET /coments/new.json
  def new
    @comment = Comment.new
    
    if !params[:site_id].nil? 
  @site = Site.find(params[:site_id])       
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end


  # DELETE /coments/1
  # DELETE /coments/1.json
  def destroy
    @site = Site.find(params[:site_id])
    @comment = @site.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to site_path(@site) }
      format.json { head :no_content }
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
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
   # GET /coments/1/edit
  def edit
        @site = Site.find(params[:site_id])
        @comment = @site.comments.find(params[:id])
  end
  
    # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    @comentario = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end
end

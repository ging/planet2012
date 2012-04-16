class CommentsController < ApplicationController

before_filter :authenticate_user!, :except => [ :index, :show ]

  # GET /comments
  # GET /comments.xml
  def index

   if params[:site_id].nil? or params[:site_id].empty?
      @comments = Comment.all
   else
      @comments = Site.find(params[:site_id]).comments
      @titulo = Site.find(params[:site_id]).name
   end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  # GET /sites/1/comments/new
  # GET /sites/1/comments/new.xml
  def new

   if params[:site_id]
      @comment = current_user.comments.build
      @comment.site_id = params[:site_id]
      @comment.user_id = current_user.id
   else
      @comment = current_user.comments.build
      @comment.user_id = current_user.id
   end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
 
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = current_user.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@comment, :notice => 'Comment was successfully created.') }
        format.xml  { render :xml => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = current_user.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@comment, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(site_comments_path(@comment.site_id)) }
      format.xml  { head :ok }
    end
  end
end

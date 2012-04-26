# ComentsController nos permite controlar las acciones relacionadas con los comentarios
#	¡IMPORTANTE! Necesario haber iniciado sesión con un usuario, excepto para el index y para show
class ComentsController < ApplicationController

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]

  # GET /coments
  # GET /coments.json
  def index
    

	 if params[:site_id].nil?	#Para que en el enlace de comentarios solo aparezcan los de el sitio en cuestión
      @coments = Coment.all            						#si no, se pondría solo esta linea
      else
      @coments = Site.find(params[:site_id]).coments  
    end
	
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coments }
    end
  end

  # Muestra un comentario especifico
  # GET /coments/1
  # GET /coments/1.json
  def show
    @coment = Coment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coment }
    end
  end

  # Nos permite crear un nuevo comentario
  # GET /coments/new
  # GET /coments/new.json
  def new
    @coment = Coment.new
    #@site = Site.find(params[:site_id])
    if !params[:site_id].nil?	
	@site = Site.find(params[:site_id])     	
    end
	

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coment }
    end
  end

  # GET /coments/1/edit
  def edit
    @coment = Coment.find(params[:id])
  end

  # POST /coments
  # POST /coments.json
  def create 
    @coment = current_user.coments.build(params[:coment]) # Asigna solo si comentario asociado a current_user
    	
    	if !params[:site_id].nil?
    		@site = Site.find(params[:site_id])
    	else    	
		@site = Site.find(params[:coment][:site_id]) 
	end
	@coment = @site.coments.create(params[:coment]) 
	
	  

	respond_to do |format|
		 if @coment.save
			format.html { redirect_to site_path(@site), notice: 'Coment was successfully created.' }
			format.json { render json: site_path(@site), status: :created, location: @coment }
	     else
		    format.html { render action: "new" }
			format.json { render json: @coment.errors, status: :unprocessable_entity }
		 end
	end
  end

  # PUT /coments/1
  # PUT /coments/1.json
  def update
    @coment = current_user.coments.find(params[:id])  # busca solo en sitios asociados a current_user
   # @coment = Coment.find(params[:id])

    respond_to do |format|
      if @coment.update_attributes(params[:coment])
        format.html { redirect_to @coment, notice: 'Coment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coments/1
  # DELETE /coments/1.json
  def destroy
    @coment = current_user.coments.find(params[:id])  # busca solo en sitios asociados a current_user
  #  @coment = Coment.find(params[:id])
    @coment.destroy

    respond_to do |format|
      format.html { redirect_to coments_url }
      format.json { head :no_content }
    end
  end
end

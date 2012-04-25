# == Qué hace este controlador
# El controlador de sites gestiona todo lo relacionado con la creación, edición y eliminación de sitios. 
# Trabaja con Devise para identificar cada sitio con el usuario que lo creó.
# Tiene dos filtros:
# * Uno para ejecutar las acciones sólo si antes se ha iniciado sesión. Este filtro no afecta a las acciones index y show.
# * Otro para ejecutar el método que define la acción count_visita después de la carga de la página.
class SitesController < ApplicationController

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]
  after_filter :count_visita, :only => :show
  
  # Este método muestra todos los sitios si no se ha especificado un tipo o los sitios de un tipo determinado. Rutas:
  # * GET /sites
  # * GET /sites.json
  def index
    if params[:type_id].nil? or params[:type_id].empty?
      @sites = Site.all            # path: /sites
    else
      @sites = Type.find(params[:type_id]).sites  # path: /types/:type_id/sites
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # Método que muestra el sitio seleccionado. Rutas:
  # * GET /sites/:id
  # * GET /sites/:id.json
  def show
    @site = Site.find(params[:id])
    @comment = current_user.comments.build if current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  # Método que permite modificar un nuevo sitio. Rutas:
  # * GET /sites/new
  # * GET /sites/new.json
  def new
    @site = current_user.sites.build # crea sitio vacio asociado a current_user
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # Método que permite editar el sitio seleccionado. Ruta:
  # * GET /sites/:id/edit
  def edit
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user
  end

  # Método que crea el nuevo sitio. Rutas:
  # * POST /sites
  # * POST /sites.json
  def create
    @site = current_user.sites.build(params[:site]) # Asigna solo si sitio asociado a current_user
    
    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render json: @site, status: :created, location: @site }
      else
        format.html { render action: "new" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que actualiza el sitio editado. Rutas:
  # * PUT /sites/:id
  # * PUT /sites/:id.json
  def update
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user 
    
    respond_to do |format|
      if @site.update_attributes(params[:site])
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # Método que permite eliminar un sitio. Rutas:
  # * DELETE /sites/:id
  # * DELETE /sites/:id.json
  def destroy
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  # Este método define una acción que incrementa el parámetro visitas del sitio actual.
  private
  def count_visita
    @site.increment!(:visitas)
  end
end

#SitesController es la clase que aglutina los métodos 
#necesarios para tratar con los sitios registrados en el sistema
#
class SitesController < ApplicationController

    

  # authenticate_user! ejecuta acción solo si sesión existe
  before_filter :authenticate_user!, :except => [ :index, :show ]
  after_filter :count_visita, :only => :show
  
  #método que muestra todos los sitios creados
  def index
    if params[:type_id].nil? or params[:type_id].empty?
      @sites = Site.all            # path: /types
      else
      @sites = Type.find(params[:type_id]).sites  # path: /types/id/sites
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sites }
    end
  end

  # método que muestra el sitio con un determinado id
  def show
    @site = Site.find(params[:id])

        @comentario=Comentario.new(:site=>@site)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site }
    end
  end

  #método que crea un nuevo sitio vacío
  def new
    @site = current_user.sites.build # crea sitio vacio asociado a current_user
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @site }
    end
  end

  # método para editar un sitio creado con anterioridad
  def edit
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user
  end

  # método necesario para crear un nuevo sitio asignado a un usuario
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

  # método para actualizar sitios creados por un usuario
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

  #método para eleminar los sitios creados por el usuario
  def destroy
    @site = current_user.sites.find(params[:id])  # busca solo en sitios asociados a current_user
    @site.destroy

    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private
  def count_visita
    @site.increment!(:visitas)
  end
  
end
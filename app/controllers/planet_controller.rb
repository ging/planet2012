class PlanetController < ApplicationController
  # GET /planet/index

  def index
  end

def search
  busqueda = params[:busqueda]
  if busqueda.length < 3
    flash[:notice] = "Debe introducir al menos 3 caracteres"
    redirect_to planet_index_path
  end
  @sites= Site.where("name like ? or description like ?" , "%" + params[:busqueda] + "%" , "%" + params[:busqueda] + "%")
  @trips= Trip.where("name like ? or description like ?" , "%" + params[:busqueda] + "%" , "%" + params[:busqueda] + "%")
  end
# GET /planet/contact

  def contact
  end

# GET /planet/ejemplo

  def ejemplo
  end

  # GET /planet/author

  def author
  end
    
end

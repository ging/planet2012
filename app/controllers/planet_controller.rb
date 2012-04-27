# == Controlador de Planet
#
# Incluye la lógica de la clase Planet
class PlanetController < ApplicationController
  # Método para mostrar la página inicial
  def index
  end
  # Método para contactar
  def contact
  end
  # Método ejemplo
  def ejemplo
  end

  def author
  end

  def search
    if params[:q].length >= 3
      @search= params[:q] 
      @sites =  Site.where("name like ? or description like ?", "%"+@search+"%", "%"+@search+"%")
      @trips =  Trip.where("name like ? or description like ?", "%"+@search+"%", "%"+@search+"%")
    else
      render action: "incorrectsearch"
    end
  end
end

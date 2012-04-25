# == PlanetController
# En esta clase se definen las siguientes acciones del controlador:
# 1. +index+
# 2. +contact+
# 3. +ejemplo+
# 4. +authors+
# 5. +search:+ hace una búsqueda de nombre o descripción de un sitio o un viaje, siempre y cuando el texto introducido sea mayor o igual a 3 caracteres
#
class PlanetController < ApplicationController

  # Método que define una acción vacía del controlador
  def index
  end
  # Método que define una acción vacía del controlador
  def contact
  end
  # Método que define una acción vacía del controlador
  def ejemplo
  end
  
  #GET planet/authors
  def authors
  end

  def search
    if params[:q].length >= 3
      @sites = Site.where("name like ? OR description like ?", "%#{params[:q]}%", "%#{params[:q]}%")
      @trips = Trip.where("name like ? OR description like ?", "%#{params[:q]}%", "%#{params[:q]}%")
    else
      
    end
  end
    
end

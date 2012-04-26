# ==Controlador de planet
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
  # Método que define una acción para mostrar a los autores de la pagina
  def author
  end
		# Método que define la accion para buscar sitios y viajes
	def search
		if params[:search].length >= 3
			@sites = Site.where("name like ? OR description like ?", "%#{params[:search]}%", "%#{params[:search]}%")
			@trips = Trip.where("name like ? OR description like ?", "%#{params[:search]}%", "%#{params[:search]}%")
		else
			render action: "index"
		end
	end
end

# PlanetController ilustra el uso de *RDoc*. La documentación de un proyecto en
# genera en el directorio *proy/doc* en formato Web con
#      $proy> rake doc:app
#
# == Algunos comandos de formateo
#
# Tal y como muestra el subitulo anterior, este se define empezando la 
# línea con ==. En los títulos debe empezar por =.
#
# Un [ ... ] seguido de texto define una lista titulada, como aquí
# [Clases, Módulos o Métodos] Se documentan con comentarios justo encima de sus definición, como aquí.
#
# Un * o - definen las entradas de una lista itemizada
# * Un URL se define así email[mailto:pepe@ejemplo.com] 
# * o así {Pepe Rubio}[mailto:pepe@ejemplo.com]
#
# Un número o letra seguido de punto genera una lista númerada
# 1. + permite generar *negrita*, igual que <b>con HTML</b>
# 2. _ permite generar _cursiva_, igual que <em>con HTML</em>
# 3. * permite generar letra de +teletipo+, igual que <tt> con HTML</tt>
#
# == Qué hace este controlador
# El controlador de planet es en gran parte un controlador de prueba con acciones vacías. Sólo hay un método con una acción
# completa, search. Esta acción busca los sitios o viajes que tengan en su nombre o en su descripción la cadena de texto introducida.
class PlanetController < ApplicationController
  
  # Método que define una acción vacía del controlador. Ruta:
  # * GET /planet/index
  def index
  end

  # Método que define una acción vacía del controlador. Ruta:
  # * GET /planet/contact
  def contact
  end

  # Método que define una acción vacía del controlador. Ruta:
  # * GET /planet/ejemplo
  def ejemplo
  end

  # Método que define una acción vacía del controlador. Ruta:
  # * GET /planet/author
  def author
  end

  # Método que permite buscar por nombre y descripción sitios y viajes. Ruta:
  # * GET /planet/search
  def search
    search = "%#{params[:search]}%"
    @sites = Site.find(:all, :conditions => ['name LIKE ? or description LIKE ?', search, search])
    @trips = Trip.find(:all, :conditions => ['name LIKE ? or description LIKE ?', search, search])

    respond_to do |format|
      format.html
      format.json { render json: @sites }
      format.json { render json: @trips }
    end
  end  
end

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
class PlanetController < ApplicationController
  # Método que define una acción vacía del controlador
  def index
  end
  # Método que define una acción vacía del controlador
  def contact
  end
  
  def author
  end


  def ejemplo
  end
  
  def minsearch
    if params[:min_visits].nil? || params[:min_visits].empty? || Integer(params[:min_visits]) < 2
       flash[:notice] = "Busqueda no realizada informar numero minimo"
    else
      @sites = Site.find(:all,
      :conditions => ["visitas > ?", params[:min_visits]])
      if @sites.nil?
        flash[:notice] = "Busqueda no resulto viajes con el numero minimo de viajes"
      else
        flash[:notice] = "Busqueda realizada con suceso"
      end
    end
  end
  
  def topsearch
    if params[:query].nil? || params[:query].empty? || params[:query].length < 3
       flash[:notice] = "Busqueda no realizada informar numero minimo"
    else
      @sites = Site.find(:all,
                :conditions => ["name LIKE ? OR description LIKE ?", "%"+params[:query]+"%", "%"+params[:query]+"%"])
      @trips = Trip.find(:all,
                :conditions => ["name LIKE ? OR description LIKE ?", "%"+params[:query]+"%", "%"+params[:query]+"%"])
      if (@sites.nil?||@sites.empty?) && (@trips.nil?||@trips.empty?)
        flash[:notice] = "Busqueda no resulto viajes con el numero minimo de viajes"
      else
        flash[:notice] = "Busqueda realizada con suceso"
      end
    end
  end
  
end

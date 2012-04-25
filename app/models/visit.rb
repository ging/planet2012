# == Qué define este modelo
# El modelo de visits define las visitas que componen cada viaje, es decir, los sitios que se desean visitar en dicho viaje.
class Visit < ActiveRecord::Base
	belongs_to :trip
	belongs_to :site
end

#Visit muestra las relaciones de la tabla visit en el modelo de datos.
#
# == Relaciones
#
# * Una visita pertenece a un viaje. 
# * Una visita pertenece a un sitio. 
#
class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

# Modela las visitas
#
# == Relaciones
#
# * Pertenece a un viaje
# * Pertenece a un sitio


class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

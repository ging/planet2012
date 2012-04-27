# Hereda lógica ORM de ActiveRecord::Base
#
# ORB (Object-Relational Mapping):
# - patrón orientado a objetos de acceso a una BBDD donde los objetos son las filas de la BBDD
#
# == Modelo de Visit con relación uno-a-muchos:
# * belongs_to: Visit referencia un objeto Trip
# * belongs_to: Visit referencia un objeto Site
class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

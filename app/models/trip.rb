# == Qué define este modelo
# El modelo de trips define los viajes que se pueden hacer. Cada viaje pertenece a un usuario determinado
# e incluye una serie de visitas (una serie de sitios a los que se pretende ir a una hora determinada).

class Trip < ActiveRecord::Base
  belongs_to 	:user
  has_many 	:visits
  has_many 	:sites, :through => :visits

  # Se añade relacion
  attr_protected :user_id # Por seguridad
end

# Trip muestra las relaciones de la tabla trip en el modelo de datos.
#
# == Relaciones
#
# * Un viaje puede tener muchas visitas. 
# * Un viaje puede tener muchos sitios. 
# * Un viaje pertenece a un usuario.
#
class Trip < ActiveRecord::Base
  belongs_to :user
  has_many   :visits
  has_many   :sites,   :through  =>  :visits 
  
  attr_protected :user_id   # por seguridad 
end

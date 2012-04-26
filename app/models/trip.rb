# Esta clase representa un viaje.
#
# Un viaje tiene los siguientes campos:
# * name
# * description: texto para describir el viaje
# * date: fecha en la que se va a realizar el viaje
# * user_id: usuario que crea el viaje
# 
# Es obligatorio que un viaje esté asociado a un usuario.
#
# Un viaje incluye diversos sitios y visitas a dichos sitios.

class Trip < ActiveRecord::Base
  belongs_to :user
  has_many   :visits, :dependent => :destroy
  has_many   :sites,   :through  =>  :visits 
  
  attr_protected :user_id   # por seguridad 
end

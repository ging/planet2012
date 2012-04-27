# Hereda lógica ORM de ActiveRecord::Base
#
# ORB (Object-Relational Mapping):
# - patrón orientado a objetos de acceso a una BBDD donde los objetos son las filas de la BBDD
#
# == Modelo de Trip con relación uno-a-muchos:
# * belongs_to: Trip referencia un objeto User
# * has_many: un Trip referenciado por muchos Visit
# * has_many: un Trip referenciado por muchos Site
class Trip < ActiveRecord::Base
  belongs_to :user
  has_many   :visits
  has_many   :sites,   :through  =>  :visits 
  
  attr_protected :user_id   # por seguridad 
end

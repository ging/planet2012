# Hereda lógica ORM de ActiveRecord::Base
#
# ORB (Object-Relational Mapping):
# - patrón orientado a objetos de acceso a una BBDD donde los objetos son las filas de la BBDD
#
# == Modelo de Comment con relación uno-a-muchos:
# * belongs_to: Comment referencia un objeto Site
# * belongs_to: Comment referencia un objeto User
class Comment < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  validates :comment, :user_id, :site_id,   :presence => true   # campo obligatorio
end

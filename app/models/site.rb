# Hereda lógica ORM de ActiveRecord::Base
#
# ORB (Object-Relational Mapping):
# - patrón orientado a objetos de acceso a una BBDD donde los objetos son las filas de la BBDD
#
# == Modelo de Site con relación uno-a-muchos:
# * belongs_to: Site referencia un objeto Type
# * belongs_to: Site referencia un objeto User
# * has_many: un Site referenciado por muchos Visit
# * has_many: un Site referenciado por muchos Trip
# * has_many: un Site referenciado por muchos Comment
class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user
  has_many   :visits
  has_many   :trips,   :through  =>  :visits

  has_many   :comments
  
  has_attached_file    :image

  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id    

  # Se añaden estas definiciones 
  validates :name, :type_id,    :presence => true   # campo obligatorio
end

# Hereda lógica ORM de ActiveRecord::Base
#
# ORB (Object-Relational Mapping):
# - patrón orientado a objetos de acceso a una BBDD donde los objetos son las filas de la BBDD
#
# == Modelo de Type con relación uno-a-muchos:
# * has_many: un Type referenciado por muchos Site
class Type < ActiveRecord::Base
  has_many :sites
  
  
  # Se añade esta definición de recurso
  validates :name, :description, :presence => true      # campo obligatorio
  validates :name,               :uniqueness => true  # Campo único (no repetido)
end

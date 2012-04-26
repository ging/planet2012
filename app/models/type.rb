# =Código del modelo de Type
#
# ==Los trips tienen los siguientes campos:
# 1.* name: nombre del type
# 2.* description: texto para describir el tipo de sitios asociados
# 
class Type < ActiveRecord::Base
  has_many :sites
  
  
  # Se añade esta definición de recurso
  validates :name, :description, :presence => true      # campo obligatorio
  validates :name,               :uniqueness => true  # Campo único (no repetido)
end

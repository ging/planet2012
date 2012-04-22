# Se definen las  relaciones de la clase Type
#
class Type < ActiveRecord::Base
  has_many :sites
  
  
  # Se añade esta definición de recurso
  validates :name, :description, :presence => true      # campo obligatorio
  validates :name,               :uniqueness => true  # Campo único (no repetido)
end

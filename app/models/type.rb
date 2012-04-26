#Type muestra las relaciones de la tabla type en el modelo de datos.
#
# == Relaciones
#
# Tal y como muestra el subitulo anterior, este se define empezando la 
# línea con ==. En los títulos debe empezar por =.
#
# * Un type puede tener muchos sitios. 
#
class Type < ActiveRecord::Base
  has_many :sites
  
  
  # Se añade esta definición de recurso
  validates :name, :description, :presence => true      # campo obligatorio
  validates :name,               :uniqueness => true  # Campo único (no repetido)
end

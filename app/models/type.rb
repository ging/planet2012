# Esta clase representa un tipo.
#
# Un tipo tiene los siguientes campos:
# * name
# * description: texto para describir el viaje
# 
# Es obligatorio que un tipo tenga un nombre único y una descripción.
#
# Un tipo tiene diversos sitios asociados.

class Type < ActiveRecord::Base
  has_many :sites
  
  # Se añade esta definición de recurso
  validates :name, :description, :presence => true      # campo obligatorio
  validates :name,               :uniqueness => true  # Campo único (no repetido)

end
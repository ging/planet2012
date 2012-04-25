# == Qué define este modelo
# El modelo de types define los tipos o categorías en los que se puede clasificar cada sitio. Un tipo agrupa a varios sitios
# que comparten unas caracterícas determinadas (como por ejemplo estar en medio de la naturaleza o ser un edificio histórico). 
# Un tipo tiene que tener obligatoriamente un nombre y una descripción, pero no pueden existir dos sitios con el mismo nombre.
class Type < ActiveRecord::Base
  has_many :sites
  
    # Se añade esta definición de recurso
  validates :name, :description, :presence => true      # campo obligatorio
  validates :name,               :uniqueness => true  # Campo único (no repetido)
end

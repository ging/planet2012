# == Qué define este modelo
# El modelo de site define un sitio, un emplazamiento en alguna parte del mundo que se añade
# por su interés turístico, especificando su tipo. Un sitio pertenece al usuario que lo ha creado
# y al tipo en el que se enmarca. Sólo el usuario que lo ha creado podrá editarlo o borrarlo. 
# Un sitio puede ser parte de muchos viajes definido como una visita. Además puede tener comentarios
# que añadan los usuarios y una imagen que lo identifique.
# Obligatoriamente un sitio tiene que tener un nombre y un tipo.

class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  has_many 	 :visits
  has_many   :trips,   :through  =>  :visits
  has_many 	 :comments

  has_attached_file    :image
  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id    

  # Se añaden estas definiciones 
  validates :name, :type_id,   :presence => true   # campo obligatorio
  #validates_numericality_of :latitud, :less_than => 90, :greater_than => -90 
  #validates_numericality_of :longitud, :less_than_or_equal_to => 180, :greater_than_or_equal_to => -180 
  #validates_numericality_of :zoom, :less_than => 20, :greater_than_or_equal_to => 0

end

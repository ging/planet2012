#Site muestra las relaciones de la tabla site en el modelo de datos.
#
# == Relaciones
# 
# * Un sitio pertenece a un tipo. 
# * Un sitio pertenece a un usuario.
# * Un sitio puede tener muchas visitas.
# * Un sitio puede tener muchos viajes.
# * Un sitio puede tener muchos comentarios.
# * Un sitio tiene una imagen asociada.
#
class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user
  has_many   :visits
  has_many   :trips,   :through  =>  :visits
  has_attached_file    :image
   has_many   :comentarios

  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id    

  # Se añaden estas definiciones 
  validates :name, :type_id,    :presence => true   # campo obligatorio
end

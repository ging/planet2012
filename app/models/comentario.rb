#Comentario muestra las relaciones de la tabla comentarios en el modelo de datos.
#
# == Relaciones
#
# * Un comentario pertenece a un trip. 
# * Un comentario pertenece a un site.
#
class Comentario < ActiveRecord::Base

	belongs_to :site
	belongs_to :user
end

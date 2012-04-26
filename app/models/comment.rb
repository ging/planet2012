# Modela los comentarios en sitios
#
# == Relaciones
#
# * Pertenece a user
# * Pertenece a site
# * Comentario tiene que ser menor que 240



class Comment < ActiveRecord::Base
	belongs_to 	:user
	belongs_to	:site
	validates :coment, :length => {:maximum => 240, :minimum => 1}
	validates :user_id, :presence => true
	validates :site_id, :presence => true

end

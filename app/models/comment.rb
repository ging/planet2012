class Comment < ActiveRecord::Base
	#Los comentarios son de los usuarios
	belongs_to :user
	#Y de los sitios
 	belongs_to :site
 	#protegido en función del usuario
 	attr_protected :user_id
end

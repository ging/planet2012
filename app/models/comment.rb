class Comment < ActiveRecord::Base
	#Los comentarios son de los usuarios
	belongs_to :user
	#Y de los sitios
 	belongs_to :site
 	
 	validates :coment, :presence => true, :length => {:maximum => 240}
end

# Esta clase representa los comentarios que un usuario puede dejar en un sitio.
#
# Un comentario tiene los siguientes campos:
# * comment: texto
# * user_id: identificador de usuario
# * site_id: identificador de sitio
# 
# Es obligatorio que los tres campos anteriores tengan un valor.

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :comment, :length => {:maximum => 240}
	validates :user_id, :presence => true
	validates :site_id, :presence => true
	validates :comment, :presence => true
end

# Esta clase representa los comentarios que un usuario puede dejar en un sitio.
# Un comentario:
# * pertenece a un sitio
# * lalala

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :comment, :length => {:maximum => 240}
	validates :user_id, :presence => true
	validates :site_id, :presence => true
	validates :comment, :presence => true
end

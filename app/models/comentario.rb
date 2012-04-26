class Comentario < ActiveRecord::Base
	belongs_to :site
	belongs_to :user

	attr_protected :user_id
	validates :coment,    :presence => true   # campo obligatorio
end

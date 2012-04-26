class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site

	# se limita a 240 caracteres
	validates :comment, :length => {:maximum => 240}
end

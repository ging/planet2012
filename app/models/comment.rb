class Comment < ActiveRecord::Base
	belongs_to 	:user
	belongs_to	:site
	validates :coment, :length => {:maximum => 240}
	validates :user_id, :presence => true
	validates :site_id, :presence => true
	validates :coment, :presence => true
end

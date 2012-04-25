class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	
	validates :user_id, :presence => true
	#attr_protected :user_id
end

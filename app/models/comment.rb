class Comment < ActiveRecord::Base
	belongs_to :site
	belongs_to :user
	attr_protected :user_id
	attr_protected :name
	validates_presence_of :user_id
end

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	validates :comment, :length => {:maximum => 240}
end

class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :site
	 

	 validates :coment, :presence => true,
                    	:length => {:maximum => 240}
end

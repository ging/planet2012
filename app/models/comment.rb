class Comment < ActiveRecord::Base
    belongs_to :user
belongs_to :site
validates :comment, :length => {:maximum => 240}
validates :user_id, :presence => true
validates :site_id, :presence => true
validates :comment, :presence => true

    attr_protected :user_id
end

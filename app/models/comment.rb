class Comment < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  attr_protected :user_id, :site_id
end

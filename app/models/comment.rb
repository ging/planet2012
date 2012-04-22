class Comment < ActiveRecord::Base
   belongs_to :user
   belongs_to :site

   attr_protected :user_id
end

class Site < ActiveRecord::Base
   belongs_to :type
   belongs_to :user

   # Prevents the assignation of sites to other users
   attr_protected :user_id

   has_many :comments
end

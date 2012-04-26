class Site < ActiveRecord::Base
   belongs_to :type
   belongs_to :user

   validates :name, :type_id, :latitude, :longitude, :zoom, :image_url, :presence => true
   validates :zoom, :numericality => {:greater_than_or_equal_to => 0.1}
   validates :name, :uniqueness => true 

   # Prevents the assignation of sites to other users
   attr_protected :user_id
end

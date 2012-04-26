class Site < ActiveRecord::Base
   belongs_to :type
   belongs_to :user
   has_many   :visits
   has_many   :trips,   :through  =>  :visits
   has_attached_file    :image
   
   validates :name, :type_id, :latitude, :longitude, :zoom, :image_url, :presence => true
   validates :zoom, :numericality => {:greater_than_or_equal_to => 0.1}
   validates :name, :uniqueness => true 

   # Debe estar protegido para evitar accesos indeseados
   attr_protected :user_id    

   # Se añaden estas definiciones 
   validates :name, :type_id,    :presence => true   # campo obligatorio

   has_many :comments
end

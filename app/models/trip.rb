class Trip < ActiveRecord::Base
  belongs_to :user
  has_many   :visits
  has_many   :sites,   :through  =>  :visits 
  
  attr_protected :user_id   # por seguridad 
end

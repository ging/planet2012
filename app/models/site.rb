# lalallaa

class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user
  has_many   :visits, :dependent => :destroy
  has_many   :trips,   :through  =>  :visits 
  has_many	 :comments, :dependent => :destroy

  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id    

  # campos obligatorios
  validates :name, :type_id, :image_url, :latitud, :longitud, :zoom, :presence => true
end

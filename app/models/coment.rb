class Coment < ActiveRecord::Base
	belongs_to :site
	belongs_to :user

  # Debe estar protegido para evitar accesos indeseados
  #attr_protected :user_id    

  # Se añaden estas definiciones 
  
  validates :site_id,  :presence => true
  validates :user_id,  :presence => true
  validates :coment, :presence => true,
                    :length => { :maximum => 240 }
	
end

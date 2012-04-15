class Comment < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

 # Debe estar protegido para evitar accesos indeseados
 #attr_protected :user_id    

  # Se añaden estas definiciones 
  validates :comment, :user_id, :site_id,    :presence => true   # campo obligatorio
  validates :comment, :length => { :maximum => 240 }

end

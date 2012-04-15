class Site < ActiveRecord::Base
  belongs_to :type
  

  
  # Debe estar protegido para evitar accesos indeseados
   

  # Se añaden estas definiciones 
  validates :name, :type_id,:image_url,    :presence => true   # campo obligatorio
end

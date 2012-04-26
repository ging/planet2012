# =Código del modelo de Comentarios
#
# ==Los comentarios tienen los siguientes campos:
# 1.* comment: texto
# 2.* user_id: identificador de usuario
# 3.* site_id: identificador de sitio
# 
class Comment < ActiveRecord::Base
	  belongs_to :user
      belongs_to :site
	
	validates :comment, :presence => true,:length => {:maximum => 240}
      # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id 
end

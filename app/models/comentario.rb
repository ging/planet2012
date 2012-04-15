class Comentario < ActiveRecord::Base
belongs_to :user
belongs_to :site

# Debe estar protegido para evitar accesos indeseados
  #attr_protected :user_id    

end

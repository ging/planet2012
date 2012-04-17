class Comentario < ActiveRecord::Base
belongs_to :user
belongs_to :site

validates :coment,  :length => {:maximum => 240}
# Debe estar protegido para evitar accesos indeseados
  #attr_protected :user_id    

end

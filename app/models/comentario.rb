# Se definen las  relaciones de la clase Comentario
#
class Comentario < ActiveRecord::Base
belongs_to :user
belongs_to :site

validates :coment, :site_id, :user_id, :length => {:maximum => 240},  :presence => true
# Debe estar protegido para evitar accesos indeseados
  #attr_protected :user_id    

end

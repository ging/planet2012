class Comentario < ActiveRecord::Base
	  belongs_to :site
      belongs_to :user

      validates :site_id,:user_id,    :presence => true #El comentario debe tener un contenido y pertenecer a un sitio y usuario
      validates :coment, :presence => true,
                :length => { :maximum => 240 }
end

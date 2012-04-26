# Esta clase representa un sitio.
#
# Un sitio tiene los siguientes campos:
# * name
# * latitud: para situar en google maps
# * longitud: para situar en google maps
# * zoom: para situar en google maps
# * description: texto para describir el sitio
# * type: tipo de sitio (monumento, ruina, etc)
# * image_url: imagen asociada al sitio
# 
# Es obligatorio que todos los campos anteriores tengan un valor excepto
# description tengan algun valor.

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

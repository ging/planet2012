# =Código del modelo de Site
#
# ==Los sites tienen los siguientes campos:
# 1.* name: nombre 
# 2.* description: texto para describir el sitio
# 3.* type: tipo de sitio (monumento, ruina, etc)
# 4.* image: imagen asociada al sitio
# 5.* latitud_geo: para situar en google maps
# 6.* longitud_geo: para situar en google maps
# 7.* zoom_geo: para situar en google maps
# 
class Site < ActiveRecord::Base
  
  belongs_to :type
  belongs_to :user
  has_many   :visits
  has_many :comments, :dependent => :destroy
  has_many   :trips,   :through  =>  :visits
  has_attached_file    :image

  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id    

  # Se añaden estas definiciones 
  validates :name, :type_id,:latitud_geo, :longitud_geo, :zoom_geo,     :presence => true   # campo obligatorio
end

# =Código del modelo de Trip
#
# ==Los trips tienen los siguientes campos:
# 1.* name: nombre del trip
# 2.* description: texto para describir el viaje
# 3.* date: fecha del viaje
# 4.* user_id: usuario que ha creado el viaje
# 

class Trip < ActiveRecord::Base
  belongs_to :user
  has_many   :visits
  has_many   :sites,   :through  =>  :visits 
  
  attr_protected :user_id   # por seguridad 
end

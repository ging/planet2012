# =Código del modelo de Visit
#
# ==Una visita tiene los siguientes campos:
# 1.* name: nombre 
# 2.* hora_asociada: Hora a la que se le asocia la visita
# 3.* trip_id: Trip al que está asociado
# 4.* site_id: Sitio al que está asociado


class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

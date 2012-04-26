# Esta clase representa las visitas a sitios que se pueden hacer en un viaje.
#
# Una visita tiene una hora asociada, un viaje y un sitio.

class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

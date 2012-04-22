# Se definen las  relaciones de la clase Visit
#
class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

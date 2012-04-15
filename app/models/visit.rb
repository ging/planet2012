class Visit < ActiveRecord::Base
  belongs_to :trip
  belongs_to :site
end

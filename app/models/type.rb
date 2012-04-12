class Type < ActiveRecord::Base
  has_many :sites
  
  validates :name, :description,
		:presence => true
end
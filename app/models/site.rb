class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  has_many :comments

  # validaciones para evitar código malicioso
  #relativos a las coordenadas GPS ¿?¿?
  #validates :name, :type_id, :latitude, :longitude, :zoom, :image_url, :presence => true
  #validates :zoom, :numericality => {:greater_than_or_equal_to => 0.1}
  validates :name, :presence => true

  attr_protected :user_id
end

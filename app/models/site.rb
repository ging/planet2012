class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  validates :name, :type_id, :image_url,:presence => true # campo obligatorio
  attr_protected :user_id


end

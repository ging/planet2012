class Type < ActiveRecord::Base
  has_many :sites

  validates :name, :description, :presence => true # campo obligatorio
  validates :name, :uniqueness => true # Campo no repetido

end

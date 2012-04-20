class Type < ActiveRecord::Base
  has_many :sites

  # validaciones para evitar código malicioso
  validates :name, :description, :presence => true  #campos obligatorios
  validates :name, :uniqueness => true #campo único (no repetido)
end

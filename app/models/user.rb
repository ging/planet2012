# Hereda lógica ORM de ActiveRecord::Base
#
# ORB (Object-Relational Mapping):
# - patrón orientado a objetos de acceso a una BBDD donde los objetos son las filas de la BBDD
#
# == Modelo de Use con relación uno-a-muchos:
# * has_many: un Use referenciado por muchos Site
# * has_many: un Use referenciado por muchos Trip
# * has_many: un Use referenciado por muchos Comment
class User < ActiveRecord::Base
  
  has_many :sites
  has_many :trips

  has_many   :comments
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end

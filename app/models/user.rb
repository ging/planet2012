# Modela los usuarios
#
# == Relaciones
#
# * Tiene varios sitios
# * Tiene varios viajes
# * Tiene varios comentarios


class User < ActiveRecord::Base
  
  has_many :sites
  has_many :trips
  has_many	:comments
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end

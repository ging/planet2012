#User muestra las relaciones de la tabla user en el modelo de datos.
#
# == Relaciones
#
# * Un usuario puede tener muchos sitios. 
# * Un usuario puede tener muchos viajes. 
# * Un usuario puede tener muchos comentarios. 
#
class User < ActiveRecord::Base
  
  has_many :sites
  has_many :trips
  has_many   :comentarios
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end

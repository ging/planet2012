# == Qué define este modelo
# El modelo de users define los usuarios de esta página web. Cada persona debe crearse un usario que le identifique dentro
# de la página web, especificando un nombre, una contraseña para evitar accesos indeseados y la suplantación de su identidad y un correo para recibir avisos y recuperar la contraseña.
# Un usuario es dueño de todos los sitios, comentarios y viajes que haya creado, y como tal sólo él podrá editarlos o borrarlos.
class User < ActiveRecord::Base
  has_many :sites
  has_many :comments
  has_many :trips
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end

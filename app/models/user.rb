class User < ActiveRecord::Base
  
  has_many :sites
  has_many :trips
  has_many :comments, :dependent => :destroy
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Para que no se pueda registrar un usuario
  # dos veces con el mismo nombre o email
  validates_presence_of :name, :email
  validates_uniqueness_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end

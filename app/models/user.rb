class User < ActiveRecord::Base
<<<<<<< HEAD
=======
  
  has_many :sites
  has_many :trips
  
>>>>>>> Entrega6/master
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

<<<<<<< HEAD
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
 
  has_many :sites
=======
  validates_presence_of :name
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
>>>>>>> Entrega6/master
end

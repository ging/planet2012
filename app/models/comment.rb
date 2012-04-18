class Comment < ActiveRecord::Base
  belongs_to :site
  belongs_to :user

  #validaciones para evitar código malicioso -- longitud máxima 240 caracteres
  validates :comment, :presence => true, :length => {:maximum => 240}

  attr_protected :user_id
end
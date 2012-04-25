class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user
  has_many   :visits
  has_many   :trips,   :through  =>  :visits
  has_attached_file    :image,
  	:styles => {
      :thumb => "50x50",
      :small  => "150x150",
      :medium => "200x200"
  }
	has_many		:comments
  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id    

  # Se añaden estas definiciones 
  validates :name, :type_id,    :presence => true   # campo obligatorio
end

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :site

  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id

  # Se añaden estas definiciones 
  validates :comment, :site_id, :user_id,    :presence => true   # campo obligatorio
end

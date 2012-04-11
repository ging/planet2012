class Site < ActiveRecord::Base
      belongs_to :type
      belongs_to :user

      # Se añaden estas definiciones
      validates :name, :type_id, :image_url,
      :presence => true # campo obligatorio

      #Debe estar protegido para evitar accesos indeseados
      attr_protected :user_id
end



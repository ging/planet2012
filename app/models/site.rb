class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  attr_protected :user_id
end

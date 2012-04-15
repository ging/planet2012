class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  has_many :comments

  attr_protected :user_id
end

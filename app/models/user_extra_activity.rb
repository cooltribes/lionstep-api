class UserExtraActivity < ActiveRecord::Base
  ### Relations
  belongs_to :user
  belongs_to :extra_activity

  ### Validations
  validates_presence_of :user_id, :extra_activity_id
end

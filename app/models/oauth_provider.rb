class OauthProvider < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Relations
  belongs_to :user

  ### Validations
  validates_uniqueness_of :uid, conditions: -> { where(deleted_at: nil) }

end

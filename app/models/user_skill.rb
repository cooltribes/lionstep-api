class UserSkill < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Relations
  belongs_to :user
  belongs_to :skill

  ### Validations
  validates_presence_of :skill_id, :user_id
end

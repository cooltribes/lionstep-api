class ProfessionalSkill < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Relations
  belongs_to :professional_experience
  belongs_to :skill

  ### Validations
  validates_presence_of :skill_id, :professional_experience_id
end

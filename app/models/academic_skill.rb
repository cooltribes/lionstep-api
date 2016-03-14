class AcademicSkill < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Relations
  belongs_to :academic_experience
  belongs_to :skill

  ### Validations
  validates_presence_of :skill_id, :academic_experience_id
end

class ProfessionalExperience < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Extension
  include Localizable

  ### Relations
  belongs_to :user
  belongs_to :sector
  belongs_to :responsibility_level
  has_many :professional_skills, dependent: :destroy
  has_many :skills, through: :professional_skills

  ### Validations
  validates_presence_of :organization, :organization_size, :sector_id, :responsibility_level_id,
    :start_date

end

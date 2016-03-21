class ProfessionalExperience < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Extension
  include Localizable

  ### Relations
  belongs_to :user
  belongs_to :sector
  has_many :professional_skills, dependent: :destroy
  has_many :skills, through: :professional_skills

  ### Validations
  validates_presence_of :position, :organization #, :country_code, :city, :sector_id

end

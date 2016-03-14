class AcademicExperience < ActiveRecord::Base
  ### Gems
  acts_as_paranoid

  ### Extension
  include Localizable

  ### Relations
  belongs_to :user
  has_many :academic_skills, dependent: :destroy
  has_many :skills, through: :academic_skills

  ### Validations
  validates_presence_of :degree, :institution, :country_code, :city

end

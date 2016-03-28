class AcademicDiploma < ActiveRecord::Base

  ### Relations
  has_many :academic_experiences

  ### Scopes
  scope :for, -> (locale){ where(locale: locale)}
end

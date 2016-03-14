class Sector < ActiveRecord::Base
  ### Relations
  has_many :professional_experiences

  ### Validations
  validates :name, presence: true
end

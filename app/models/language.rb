class Language < ActiveRecord::Base
  ### Relations
  has_many :language_levels, dependent: :destroy
  has_many :languages, through: :language_levels

  ### Validations
  validates :name, uniqueness: true, presence: true
end

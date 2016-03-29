class Language < ActiveRecord::Base
  ### Relations
  has_many :language_levels, dependent: :destroy
  has_many :languages, through: :language_levels

  ### Validations
  validates :name, uniqueness: { scope: :locale }, presence: true

  ### Scopes
  scope :for, -> (locale){ where(locale: locale)}
end

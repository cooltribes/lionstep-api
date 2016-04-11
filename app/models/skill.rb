class Skill < ActiveRecord::Base
  ### Relations
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills

  ### Validations
  validates :name, uniqueness: true, presence: true

  ### Scopes
  scope :for, -> (locale){ where(locale: locale)}
end

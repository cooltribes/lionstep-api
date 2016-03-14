class Skill < ActiveRecord::Base
  ### Relations
  has_many :skill_levels, dependent: :destroy
  has_many :users, through: :skill_levels

  ### Validations
  validates :name, uniqueness: true, presence: true
end

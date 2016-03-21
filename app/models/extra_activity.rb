class ExtraActivity < ActiveRecord::Base
  ### Relations
  has_many :user_extra_activities, dependent: :destroy
  has_many :users, through: :user_extra_activities

  ### Validations
  validates :name, uniqueness: true, presence: true
end

class UserDetailSerializer < ActiveModel::Serializer
  attributes :id, :email
  # has_one :profile
  # has_many :contacts
  # has_many :professional_experiences
  # has_many :academic_experiences
  # has_many :user_skills
  # has_many :language_levels
end

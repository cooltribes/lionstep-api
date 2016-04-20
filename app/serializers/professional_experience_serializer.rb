class ProfessionalExperienceSerializer < ActiveModel::Serializer
  attributes :id, :position, :organization, :start_date, :end_date,
    :country_code, :city, :current, :skills, :is_startup, :organization_size
  belongs_to :user
  belongs_to :sector
  belongs_to :responsibility_level

  def skills
    object.skills.pluck(:name)
  end
end

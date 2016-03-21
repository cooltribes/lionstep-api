class ProfessionalExperienceSerializer < ActiveModel::Serializer
  attributes :id, :position, :organization, :start_date, :end_date,
    :country_code, :city, :current, :skills
  belongs_to :user
  belongs_to :sector

  def skills
    object.skills.pluck(:name)
  end
end

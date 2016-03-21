class AcademicExperienceSerializer < ActiveModel::Serializer
  attributes :id, :degree, :institution, :start_date, :end_date,
    :minimum_grade, :maximum_grade, :actual_grade, :country_code, :city, :skills
  belongs_to :user

  def skills
    object.skills.pluck(:name)
  end
end

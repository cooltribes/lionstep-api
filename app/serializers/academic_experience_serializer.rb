class AcademicExperienceSerializer < ActiveModel::Serializer
  attributes :id, :degree, :institution, :start_date, :end_date,
    :minimum_grade, :maximum_grade, :actual_grade, :country_code, :city
  belongs_to :user
end

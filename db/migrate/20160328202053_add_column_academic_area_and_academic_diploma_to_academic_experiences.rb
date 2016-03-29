class AddColumnAcademicAreaAndAcademicDiplomaToAcademicExperiences < ActiveRecord::Migration
  def change
    add_reference :academic_experiences, :academic_degree, index: true, foreign_key: true
    add_reference :academic_experiences, :academic_area, index: true, foreign_key: true
  end
end

class AddColumnCurrentToAcademicExperiences < ActiveRecord::Migration
  def change
    add_column :academic_experiences, :current, :boolean
  end
end

class CreateAcademicExperiences < ActiveRecord::Migration
  def change
    create_table :academic_experiences do |t|
      t.string :degree
      t.string :institution
      t.date :start_date
      t.date :end_date
      t.string :minimum_grade
      t.string :maximum_grade
      t.string :actual_grade
      t.string :country_code, index: true
      t.string :city, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

class CreateJoinTableAcademicSkills < ActiveRecord::Migration
  def change
    create_table :academic_skills do |t|
      t.references :academic_experience, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
      t.integer :level, default: 0

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

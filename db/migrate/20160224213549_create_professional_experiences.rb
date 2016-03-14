class CreateProfessionalExperiences < ActiveRecord::Migration
  def change
    create_table :professional_experiences do |t|
      t.string :position
      t.string :organization
      t.date :start_date
      t.date :end_date
      t.string :country_code, index: true
      t.string :city, index: true
      t.boolean :current, default: false
      t.references :user, index: true, foreign_key: true
      t.references :sector, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

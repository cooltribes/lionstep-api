class CreateAcademicAreas < ActiveRecord::Migration
  def change
    create_table :academic_areas do |t|
      t.string :name
      t.string :locale

      t.timestamps null: false
    end
    add_index :academic_areas, :locale
  end
end

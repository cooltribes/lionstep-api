class CreateAcademicDegrees < ActiveRecord::Migration
  def change
    create_table :academic_degrees do |t|
      t.string :name
      t.string :locale

      t.timestamps null: false
    end
    add_index :academic_degrees, :locale
  end
end

class CreateAcademicDiplomas < ActiveRecord::Migration
  def change
    create_table :academic_diplomas do |t|
      t.string :name
      t.string :locale

      t.timestamps null: false
    end
    add_index :academic_diplomas, :locale
  end
end

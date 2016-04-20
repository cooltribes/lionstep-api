class CreateResponsibilityLevels < ActiveRecord::Migration
  def change
    create_table :responsibility_levels do |t|
      t.string :name
      t.string :locale

      t.timestamps null: false
    end
  end
end

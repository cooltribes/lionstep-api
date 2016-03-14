class CreateLanguageLevels < ActiveRecord::Migration
  def change
    create_table :language_levels do |t|
      t.references :user, index: true, foreign_key: true
      t.references :language, index: true, foreign_key: true
      t.integer :level, default: 0

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

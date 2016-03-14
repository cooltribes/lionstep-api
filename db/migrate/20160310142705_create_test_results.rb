class CreateTestResults < ActiveRecord::Migration
  def change
    create_table :test_results do |t|
      t.integer :extraversion, default: 0
      t.integer :intuition, default: 0
      t.integer :feeling, default: 0
      t.integer :perceiving, default: 0
      t.integer :introversion, default: 0
      t.integer :sensing, default: 0
      t.integer :thinking, default: 0
      t.integer :judging, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

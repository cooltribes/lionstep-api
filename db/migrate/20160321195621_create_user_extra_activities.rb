class CreateUserExtraActivities < ActiveRecord::Migration
  def change
    create_table :user_extra_activities do |t|
      t.references :user, index: true, foreign_key: true
      t.references :extra_activity, index: true, foreign_key: true
      t.integer :level, default: 0

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

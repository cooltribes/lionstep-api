class CreateExtraActivities < ActiveRecord::Migration
  def change
    create_table :extra_activities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

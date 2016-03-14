class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.date :born_date
      t.references :user, index: true, foreign_key: true
      t.string :country_code, index: true
      t.string :city, index: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

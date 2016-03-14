class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :info
      t.integer :privacy, default: 0
      t.integer :contact_type, default: 0
      t.references :contactable, polymorphic: true, index: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

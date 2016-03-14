class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :subdomain

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

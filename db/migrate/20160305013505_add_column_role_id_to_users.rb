class AddColumnRoleIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_id, :integer, index: true, default: 1
  end
end

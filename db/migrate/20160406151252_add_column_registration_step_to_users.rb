class AddColumnRegistrationStepToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registration_step, :string
  end
end

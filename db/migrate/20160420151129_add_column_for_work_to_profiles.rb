class AddColumnForWorkToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :currently_work, :boolean, default: false
    add_column :profiles, :previously_worked, :boolean, default: false
  end
end

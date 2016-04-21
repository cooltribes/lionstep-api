class AddColumnDesireSectorIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :desired_sector_id, :integer
  end
end

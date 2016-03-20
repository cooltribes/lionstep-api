class AddColumnDriverLicenseToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :driver_license, :boolean, default: true
  end
end

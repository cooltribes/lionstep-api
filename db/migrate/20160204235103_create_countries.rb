class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :cc_fips
      t.string :cc_iso
      t.string :tld
      t.string :name

      t.timestamps null: false
    end
  end
end

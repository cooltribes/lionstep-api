class AddColumnLocaleToSectors < ActiveRecord::Migration
  def change
    add_column :sectors, :locale, :string
    add_index :sectors, :locale
  end
end

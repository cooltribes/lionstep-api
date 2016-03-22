class AddColumnLocaleToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :locale, :string
    add_index :skills, :locale
  end
end

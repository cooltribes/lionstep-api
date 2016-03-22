class AddColumnLocaleToSkills < ActiveRecord::Migration
  def change
    add_column :skills, :locale, :string, default: "en"
    add_index :skills, :locale
  end
end

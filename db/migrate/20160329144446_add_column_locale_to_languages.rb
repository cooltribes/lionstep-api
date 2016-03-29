class AddColumnLocaleToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :locale, :string
    add_index :languages, :locale
  end
end

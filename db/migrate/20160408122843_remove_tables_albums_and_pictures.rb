class RemoveTablesAlbumsAndPictures < ActiveRecord::Migration
  def change
    drop_table :albums
    drop_table :pictures
  end
end

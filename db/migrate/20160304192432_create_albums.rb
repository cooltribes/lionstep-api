class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.references :albumable, polymorphic: true
      t.references :owner, index: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

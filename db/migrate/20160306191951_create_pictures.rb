class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.boolean :avatar, default: false
      t.boolean :cover, default: false
      t.string :image
      t.references :album, index: true
      t.references :owner, index: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true

    end
  end
end

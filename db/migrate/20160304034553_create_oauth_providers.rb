class CreateOauthProviders < ActiveRecord::Migration
  def change
    create_table :oauth_providers do |t|
      t.string :uid
      t.string :provider
      t.string :token
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end

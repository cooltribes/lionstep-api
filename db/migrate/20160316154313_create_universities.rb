class CreateUniversities < ActiveRecord::Migration
  def change
    create_table :universities do |t|
      t.string :rank_2014
      t.string :rank_2013
      t.string :score_2015
      t.string :name

      t.timestamps null: false
    end
  end
end

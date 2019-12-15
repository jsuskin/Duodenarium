class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, foreign_key: true
      t.text :title
      t.string :url
      t.text :image

      t.timestamps
    end
  end
end

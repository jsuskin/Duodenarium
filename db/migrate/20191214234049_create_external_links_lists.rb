class CreateExternalLinksLists < ActiveRecord::Migration[5.2]
  def change
    create_table :external_links_lists do |t|
      t.belongs_to :song, foreign_key: true
      t.string :discogs
      t.string :bandcamp
      t.string :soundcloud

      t.timestamps
    end
  end
end

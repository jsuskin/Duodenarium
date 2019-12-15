class AddSongToTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :tags, :song, foreign_key: true
  end
end

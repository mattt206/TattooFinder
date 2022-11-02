class AddArtistInfoToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :artist_info, :integer
  end
end

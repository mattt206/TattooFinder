class AddArtistidToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :artist_info, :integer
  end
end

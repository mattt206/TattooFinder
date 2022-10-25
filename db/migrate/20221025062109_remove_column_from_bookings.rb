class RemoveColumnFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :service_id
  end
end

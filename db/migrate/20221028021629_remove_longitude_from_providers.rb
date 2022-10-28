class RemoveLongitudeFromProviders < ActiveRecord::Migration[7.0]
  def change
    remove_column :providers, :longitude, :string
  end
end

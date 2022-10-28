class RemoveLatitudeFromProviders < ActiveRecord::Migration[7.0]
  def change
    remove_column :providers, :latitude, :string
  end
end

class AddCoordinatesToProviders < ActiveRecord::Migration[7.0]
  def change
    add_column :providers, :latitude, :float
    add_column :providers, :longitude, :float
  end
end

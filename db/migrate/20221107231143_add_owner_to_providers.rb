class AddOwnerToProviders < ActiveRecord::Migration[7.0]
  def change
    add_column :providers, :owner, :integer
  end
end

class RemoveCategoryFromProviders < ActiveRecord::Migration[7.0]
  def change
    remove_column :providers, :category, :string
  end
end

class AddCategoryToProviders < ActiveRecord::Migration[7.0]
  def change
    add_column :providers, :category, :string, array: true, null: false, default: [], allow_blank: false
  end
end

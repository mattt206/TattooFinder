class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :style
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

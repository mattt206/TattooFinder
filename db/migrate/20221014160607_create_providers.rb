class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :address
      t.string :latitude
      t.string :longitude
      t.datetime :start_time
      t.datetime :close_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

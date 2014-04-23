class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.string :location_size
      t.boolean :available_forest_firefighters, default: false
    end
  end
end

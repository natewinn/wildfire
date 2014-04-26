class CreateWildfires < ActiveRecord::Migration
  def change
    create_table :wildfires do |t|
      t.string :wildfire_name
      t.date :wildfire_date
      t.string :wildfire_cost
      t.string :wildfire_cause
      t.integer :location_id

      t.timestamps
    end
  end
end

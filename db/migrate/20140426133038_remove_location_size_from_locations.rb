class RemoveLocationSizeFromLocations < ActiveRecord::Migration
  def change
    remove_column :locations, :location_size, :string
  end
end

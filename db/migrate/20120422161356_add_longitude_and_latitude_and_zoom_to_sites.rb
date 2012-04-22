class AddLongitudeAndLatitudeAndZoomToSites < ActiveRecord::Migration
  def change
    add_column :sites, :longitude, :float

    add_column :sites, :latitude, :float

    add_column :sites, :zoom, :float

  end
end

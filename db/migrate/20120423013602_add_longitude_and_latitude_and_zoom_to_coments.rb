class AddLongitudeAndLatitudeAndZoomToComents < ActiveRecord::Migration
  def change
    add_column :coments, :longitude, :float

    add_column :coments, :latitude, :float

    add_column :coments, :zoom, :int

  end
end

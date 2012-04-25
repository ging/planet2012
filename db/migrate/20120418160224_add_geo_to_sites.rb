class AddGeoToSites < ActiveRecord::Migration
  def change
    add_column :sites, :longitud, :float

    add_column :sites, :latitud, :float

    add_column :sites, :zoom, :integer

  end
end

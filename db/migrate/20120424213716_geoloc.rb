class Geoloc < ActiveRecord::Migration
  def up
  	add_column :sites, :latitud, :float
  	add_column :sites, :longitud, :float
  	add_column :sites, :zoom, :integer
  end

  def down
  end
end

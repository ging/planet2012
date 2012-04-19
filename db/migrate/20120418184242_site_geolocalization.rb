class SiteGeolocalization < ActiveRecord::Migration
  def up
	change_table :sites do |t|
	 t.column :latitud, :float
  	end
	change_table :sites do |t|
	 t.column :longitud, :float
  	end
	change_table :sites do |t|
	 t.column :zoom, :integer
  	end
  end

  def down
	change_table :sites do |t|
	 t.remove :latitud
	end
	change_table :sites do |t|
	 t.remove :longitud
	end
	change_table :sites do |t|
	 t.remove :zoom
	end
  end
end

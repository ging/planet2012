class SiteGeopos < ActiveRecord::Migration
  def up
  	change_table :sites do |t|
  		t.column :latitud, :float
  		t.column :longitud, :float
  		t.column :zoom, :integer  		
  	end
  end

  def down
  end
end

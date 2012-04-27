class PositionSites < ActiveRecord::Migration
  def up
  	change_table :sites do |t|
  		t.column :longitud, :float
  		t.column :latitud, :float
  		t.column :zoom, :integer
  	end
  end

  def down
  	change_table :sites do |t|
  		t.remove :longitud
  		t.remove :latitud
  		t.remove :zoom
  	end
  end
end

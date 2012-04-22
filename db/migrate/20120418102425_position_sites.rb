class PositionSites < ActiveRecord::Migration
  def up
  	change_table :sites do |t|
  		t.column :longitud, :integer
  		t.column :latitud, :integer
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

class GeoLoc < ActiveRecord::Migration
def up
  	change_table :sites do |t|
  		t.column :latitud,:double
      t.column :longitud,:double
      t.column :zoom,:double
  	end
  end

  def down
  	change_table :sites do |t|
  		t.remove :latitud
      t.remove :longitud
      t.remove :zoom
  	end
  end
end

class SiteGeo < ActiveRecord::Migration
  def up
    change_table :sites do |t|
        t.column :longitud_geo, :float	
	t.column :latitud_geo, :float
	t.column :zoom_geo, :integer
    end
  end
  def down
    change_table :sites do |t|
      t.remove :longitud_geo ,:float
      t.remove :latitud_geo  ,:float
      t.remove :zoom_geo     ,:integer
    end
  end
end

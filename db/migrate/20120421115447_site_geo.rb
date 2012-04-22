class SiteGeo < ActiveRecord::Migration
  def up
    change_table :sites do |t|
        t.column :longitud_geo, :double
	t.column :latitud_geo, :double
	t.column :zoom_geo, :integer
    end
  end
  def down
    change_table :sites do |t|
      t.remove :longitud_geo ,:double
      t.remove :latitud_geo  ,:double
      t.remove :zoom_geo     ,:integer
    end
  end
end

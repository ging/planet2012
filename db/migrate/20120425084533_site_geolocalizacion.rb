class SiteGeolocalizacion < ActiveRecord::Migration
  def up
    change_table :sites do |t| #añade las columnas de longuitud, latitud y zom a la tabla sites
      t.column :longuitud, :float
      t.column :latitud, :float
      t.column :zoom, :integer
    end
  end

  def down
    change_table :sites do |t|
      t.remove :longuitud, :float
      t.remove :latitud, :float
      t.remove :zoom, :integer 
    end
  end
end

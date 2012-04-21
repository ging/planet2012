class Maps < ActiveRecord::Migration
  def up
  change_table :sites do |t|  # añade la columna name a la tabla sites
      t.column :latitud, :float
	   t.column :longitud, :float
	   t.column :zoom, :integer
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

class SiteGelocation < ActiveRecord::Migration
  def up
   change_table :sites do |t|
	t.column :latitud,  :decimal
	t.column :longitud, :decimal
	t.column :zoom,     :decimal
  end
end

  def down
   change_table :sites do |t|
	t.remove :latitud,  :decimal
	t.remove :longitud, :decimal
	t.remove :zoom,     :decimal
  end
   
  end
end

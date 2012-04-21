class LocalizacionSitios < ActiveRecord::Migration
  def up
	change_table :sites do |t|
		t.column :lat, :integer
		t.column :long, :integer
		t.column :zoom, :integer
  	end
  end

  def down
	change_table :sites do |t|
		t.column :lat, :integer
		t.column :long, :integer
		t.column :zoom, :integer
  	end
  end
end

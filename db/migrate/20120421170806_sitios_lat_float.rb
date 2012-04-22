class SitiosLatFloat < ActiveRecord::Migration
  def up
	change_column :sites, :lat, :float
	change_column :sites, :long, :float
	change_column :sites, :zoom, :float
  end

  def down
  end
end

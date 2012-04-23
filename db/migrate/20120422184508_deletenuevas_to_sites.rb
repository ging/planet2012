class DeletenuevasToSites < ActiveRecord::Migration
  def up
  end

  def down

	remove_column :sites, :longitud
	remove_column :sites, :latitud
	remove_column :sites, :zoom
  end
end

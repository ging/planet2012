class AddnewzoomTosites < ActiveRecord::Migration
  def up
	add_column :sites, :zoom, :integer
  end

  def down
	remove_column :sites, :zoom
  end
end

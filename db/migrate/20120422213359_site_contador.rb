class SiteContador < ActiveRecord::Migration
  def up
  	change_table :sites do |t|
	t.column :times_added, :integer
	end
  end

  def down
  	change_table :sites do |t|
	t.column :times_added, :integer
	end
  end
end

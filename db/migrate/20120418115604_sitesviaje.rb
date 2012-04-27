class Sitesviaje < ActiveRecord::Migration
  def up
  	change_table :sites do |t|
  		t.column :viajes, :integer, :default => 0
  	end
  end

  def down
  	  change_table :sites do |t|
  		t.remove :viajes
  	end
  end
end

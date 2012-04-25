class RmSiteVisitas < ActiveRecord::Migration
 def self.up
  change_table :sites do |t|
   t.remove :visitas
  end
 end

 def self.down
 end
end

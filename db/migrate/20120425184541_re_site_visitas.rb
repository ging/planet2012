class ReSiteVisitas < ActiveRecord::Migration
 def self.up
  change_table :sites do |t| # añade la columna visits a la tabla sites
   t.column :visitas, :integer, :default => 0
  end
 end

 def self.down
  change_table :sites do |t|
   t.remove :visitas
  end
 end
end

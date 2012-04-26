class SiteVisits < ActiveRecord::Migration
  def up
    change_table :sites do |t|
      t.column :visits, :integer, :default => 0
    end
  end

  def down
    change_table :sites do |t|
      t.remove :visits
    end
  end
end

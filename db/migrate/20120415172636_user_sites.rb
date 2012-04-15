class UserSites < ActiveRecord::Migration
  def up
  	change_table :sites do |t|
  		t.column :user_id,:integer
  	end
  end

  def down
  	change_table :sites do |t|
  		t.remove :user_id
  	end
  end
end

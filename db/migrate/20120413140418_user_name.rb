class UserName < ActiveRecord::Migration
  def up
    change_table :users do |t|
    t.column :name,:string
    end
  end

  def down
    change_table :users do |t|
    t.remove :name
    end
  end

end

class UserName < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.column :name, :string
    end
  end

  def self.down
    change_table :users do |t|
      t.remove :name
    end
  end
end

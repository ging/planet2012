class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
  
  def self.down
    drop_table :types
  end
end

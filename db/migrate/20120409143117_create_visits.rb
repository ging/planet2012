class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :trip_id
      t.integer :site_id
      t.integer :hour

      t.timestamps
    end
  end
end

class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :description
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end

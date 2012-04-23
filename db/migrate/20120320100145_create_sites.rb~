class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.text :description
      t.integer :type_id
      t.string :image_url
      t.float :longitud
      t.float :latitud
      t.integer :zoom
      t.timestamps
    end
  end
end

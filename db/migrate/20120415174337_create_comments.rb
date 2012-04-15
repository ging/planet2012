class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :coment
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
  end
end

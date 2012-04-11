class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :site_id
      t.references :user
      t.references :site

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :site_id
  end
end

class AddPaperclipToSites < ActiveRecord::Migration
  def up
    change_table :sites do |t|
      t.column :image_file_name,      :string
      t.column :image_content_type,   :string
      t.column :image_file_size,      :string
      t.column :image_updated_at,     :datetime
    end
  end
  
  def down
    change_table :sites do |t|
      t.remove :image_file_name,      :string
      t.remove :image_content_type,   :string
      t.remove :image_file_size,      :string
      t.remove :image_updated_at,     :datetime
    end
  end
end

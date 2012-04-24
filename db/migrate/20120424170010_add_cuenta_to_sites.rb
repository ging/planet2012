class AddCuentaToSites < ActiveRecord::Migration
  def change
    add_column :sites, :cuenta, :integer, :default => 0

  end
end

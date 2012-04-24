class AddCuentaToSites < ActiveRecord::Migration
  def change
    add_column :sites, :cuenta, :integer

  end
end

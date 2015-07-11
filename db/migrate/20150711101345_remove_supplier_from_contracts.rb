class RemoveSupplierFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :supplier, :string
    add_column :contracts, :supplier_id, :integer 
  end
end

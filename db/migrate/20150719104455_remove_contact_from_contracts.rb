class RemoveContactFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :contact, :string
  end
end

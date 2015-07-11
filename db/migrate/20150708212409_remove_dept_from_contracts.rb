class RemoveDeptFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :dept, :string
    add_column :contracts, :dept_id, :integer
  end
end

class AddUserIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :user_id, :integer
  end
end

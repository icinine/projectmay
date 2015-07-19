class RemoveDownloadFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :download, :string
  end
end

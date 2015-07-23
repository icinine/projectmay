class AddDateToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :dateFrom, :datetime
    add_column :contracts, :dateTo, :datetime
  end
end

class ContractRegions < ActiveRecord::Migration
  def change
    create_table :contract_regions do |t|
      t.integer :region_id, :contract_id
    end
  end

end

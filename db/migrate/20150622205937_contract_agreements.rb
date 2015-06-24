class ContractAgreements < ActiveRecord::Migration
  def change
    create_table :contract_agreements do |t|
      t.integer :agreement_type_id, :contract_id
    end
  end
end

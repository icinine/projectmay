class CreateAgreementType < ActiveRecord::Migration
  def change
    create_table :agreement_types do |t|
      
      t.string :doctype
    end
  end
end

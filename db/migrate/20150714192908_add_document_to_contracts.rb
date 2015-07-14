class AddDocumentToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :document, :string
  end
end

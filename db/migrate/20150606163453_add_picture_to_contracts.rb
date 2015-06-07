class AddPictureToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :picture, :string
  end
end

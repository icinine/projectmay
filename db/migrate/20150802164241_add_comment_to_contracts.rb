class AddCommentToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :comment, :text
  end
end

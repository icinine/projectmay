class ChangeDocumentToAttachment < ActiveRecord::Migration
  def change
    remove_column :contracts, :document, :string
    add_column :contracts, :attachment, :string 
  end
end

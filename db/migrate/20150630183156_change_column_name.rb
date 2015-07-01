class ChangeColumnName < ActiveRecord::Migration
  def change
     remove_column :agreement_types, :doctype, :string
    add_column :agreement_types, :name, :string
  end
end

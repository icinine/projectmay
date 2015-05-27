class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.text :desc
      t.string :region
      t.integer :value
      t.integer :saving
      t.string :supplier
      t.string :contact
      t.string :dept
      t.string :download
      t.timestamps
      
    end
  end
end

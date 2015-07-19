class Invoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :product_id, null: false
      t.integer :driver_id, null: false
      t.float :price, null: false
      t.integer :region_id, null: false
      t.string :type, null: false
      
      t.timestamps null: false
    end
    add_index :invoices, :product_id
    add_index :invoices, :driver_id
  end
end

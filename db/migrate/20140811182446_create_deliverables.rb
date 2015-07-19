class CreateDeliverables < ActiveRecord::Migration
  def change
    create_table :deliverables do |t|
      t.integer :driver_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, default: 0

      t.timestamps
    end
    add_index :deliverables, :driver_id
    add_index :deliverables, :product_id
  end
end

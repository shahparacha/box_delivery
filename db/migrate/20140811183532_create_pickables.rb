class CreatePickables < ActiveRecord::Migration
  def change
    create_table :pickables do |t|
      t.integer :hub_id, null: false
      t.integer :product_id, null: false
      t.integer :quantity, default: 0

      t.timestamps
    end
    add_index :pickables, :hub_id
    add_index :pickables, :product_id
  end
end

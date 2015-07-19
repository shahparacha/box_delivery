class DropColumnQuantity < ActiveRecord::Migration
  def change
    remove_column :deliverables, :quantity
  end
end

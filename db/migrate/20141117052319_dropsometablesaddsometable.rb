class Dropsometablesaddsometable < ActiveRecord::Migration
  def change
    remove_column :drivers, :gram_quantity
    remove_column :drivers, :eight_ounce_quantity
    remove_column :drivers, :fourth_ounce_quantity
    remove_column :drivers, :half_ounce_quantity
    add_column :deliverables, :gram_quantity, :integer, default: 0
    add_column :deliverables, :eight_ounce_quantity, :integer, default: 0
    add_column :deliverables, :fourth_ounce_quantity, :integer, default: 0
    add_column :deliverables, :half_ounce_quantity, :integer, default: 0
  end
end

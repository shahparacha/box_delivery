class Dropcolumnsfromdriverandaddsome < ActiveRecord::Migration
  def change
    remove_column :drivers, :quantity
    add_column :drivers, :gram_quantity, :integer
    add_column :drivers, :eight_ounce_quantity, :integer
    add_column :drivers, :fourth_ounce_quantity, :integer
    add_column :drivers, :half_ounce_quantity, :integer
  end
end

class ChangeTypeOnQuantityColumn < ActiveRecord::Migration
  def change
    remove_column :drivers, :quantity
  end
end

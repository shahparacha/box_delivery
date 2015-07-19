class AddColumnOunce < ActiveRecord::Migration
  def change
    add_column :deliverables, :ounce_quantity, :integer
    add_column :products, :ounce_price, :integer
  end
end

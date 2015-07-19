class AddColumnsToProductsTable < ActiveRecord::Migration
  def change
    add_column :products, :eight_ounce_price, :string
    add_column :products, :fourth_ounce_price, :string
    add_column :products, :half_ounce_price, :string
  end
end

class Addcolumnstoproducts < ActiveRecord::Migration
  def change
    add_column :products, :name, :string
    add_column :products, :product_description, :string
    add_column :products, :gram_price, :float
  end
end

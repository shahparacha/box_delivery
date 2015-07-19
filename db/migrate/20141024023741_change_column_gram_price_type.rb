class ChangeColumnGramPriceType < ActiveRecord::Migration
  def change
    change_column :products, :gram_price, :string, :null => false
  end
end

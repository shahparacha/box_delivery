class AddColumnThcToProducts < ActiveRecord::Migration
  def change
    add_column :products, :thc, :float, null: :false
  end
end

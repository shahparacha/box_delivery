class AddColumnQuantityType < ActiveRecord::Migration
  def change
    remove_column :invoices, :quantity
    add_column :invoices, :quantity_type, :string
  end
end

class AddColumnQuantityToInvoicesTable < ActiveRecord::Migration
  def change
    add_column :invoices, :quantity, :integer, null: :false
  end
end

class Invoicesdrivers < ActiveRecord::Migration
  def change
    add_column :invoices, :payment_type, :string
    add_column :drivers, :total_cash, :integer, default: 0
  end
end

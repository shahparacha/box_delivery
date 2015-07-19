class AddDriverColumnToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :driver_id, :integer
  end
end

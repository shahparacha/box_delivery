class DeleteColumnsFromInvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :region_id
    remove_column :invoices, :is_delivery
    add_column :invoices, :order_id, :integer
  end
end

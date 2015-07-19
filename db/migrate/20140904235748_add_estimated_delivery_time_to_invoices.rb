class AddEstimatedDeliveryTimeToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :estimated_delivery_time_minutes, :integer
  end
end

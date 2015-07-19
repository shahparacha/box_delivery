class AddcolumnisDeliverytoinvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :is_delivery, :boolean
  end
end

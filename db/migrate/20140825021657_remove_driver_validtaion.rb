class RemoveDriverValidtaion < ActiveRecord::Migration
  def change
    remove_column :invoices, :driver_id
  end
end

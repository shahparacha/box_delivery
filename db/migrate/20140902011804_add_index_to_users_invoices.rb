class AddIndexToUsersInvoices < ActiveRecord::Migration
  def change
    add_index :invoices, :user_id
  end
end

class AddUsersToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :user_id, :integer
  end
end

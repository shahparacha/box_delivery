class Addquantitycolumntoinvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :quantity, :integer, default: 0
  end
end

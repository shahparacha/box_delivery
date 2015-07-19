class Addcolumnscompletedlonglattoinvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :longitude, :float
    add_column :invoices, :latitude, :float
    add_column :invoices, :completed, :boolean, default: false
  end
end

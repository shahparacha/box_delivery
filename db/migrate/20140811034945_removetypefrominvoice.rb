class Removetypefrominvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :type
  end
end

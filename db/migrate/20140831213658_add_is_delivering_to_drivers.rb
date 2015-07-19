class AddIsDeliveringToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :is_delivering, :boolean, default: false
  end
end

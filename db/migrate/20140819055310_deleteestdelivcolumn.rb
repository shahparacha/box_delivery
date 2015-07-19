class Deleteestdelivcolumn < ActiveRecord::Migration
  def change
    change_column :drivers, :estimated_last_delivery_time, :datetime
  end
end

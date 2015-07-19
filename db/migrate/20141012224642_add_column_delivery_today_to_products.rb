class AddColumnDeliveryTodayToProducts < ActiveRecord::Migration
  def change
    add_column :products, :delivering_today, :boolean
  end
end

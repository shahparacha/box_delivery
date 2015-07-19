class AddIndexToDeliveringToday < ActiveRecord::Migration
  def change
  end
  add_index :products, :delivering_today
end

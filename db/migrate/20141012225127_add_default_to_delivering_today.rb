class AddDefaultToDeliveringToday < ActiveRecord::Migration
  def change
    change_column :products, :delivering_today, :boolean, :default => false
  end
end

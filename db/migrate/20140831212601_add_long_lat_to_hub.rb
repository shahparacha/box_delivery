class AddLongLatToHub < ActiveRecord::Migration
  def change
    add_column :hubs, :longitude, :float
    add_column :hubs, :latitude, :float
    change_column :drivers, :total_cash, :float
  end
end

class Addlonglatesttimetodriver < ActiveRecord::Migration
  def change
    add_column :drivers, :longitude, :float
    add_column :drivers, :latitude, :float
    add_column :drivers, :estimated_last_delivery_time, :string
  end
end

class Addindextohubidondrivers < ActiveRecord::Migration
  def change
    add_index :drivers, :hub_id
  end
end

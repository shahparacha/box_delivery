class Addhubidcolumntodrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :hub_id, :integer
  end
end

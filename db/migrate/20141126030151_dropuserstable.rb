class Dropuserstable < ActiveRecord::Migration
  def change
    drop_table :users
  end
end

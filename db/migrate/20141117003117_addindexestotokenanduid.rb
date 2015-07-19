class Addindexestotokenanduid < ActiveRecord::Migration
  def change
    add_index :users, :uid, using: "btree"
    add_index :users, :token, using: "btree"
  end
end

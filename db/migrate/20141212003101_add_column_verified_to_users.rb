class AddColumnVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :verified, :bool, default: false
  end
end

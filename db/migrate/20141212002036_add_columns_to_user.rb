class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :birth_date, :string
    add_column :users, :mobile, :string
    add_column :users, :recommendation_id, :string
    add_column :users, :license_number, :string
    add_column :users, :license_expiration, :string
    add_column :users, :license, :string
  end
end

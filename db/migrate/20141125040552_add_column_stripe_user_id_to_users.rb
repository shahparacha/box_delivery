class AddColumnStripeUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_user_id, :integer
    add_index :users, :stripe_user_id
  end
end

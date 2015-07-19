class AddDefaultToStripeUserId < ActiveRecord::Migration
  def change
    change_column :users, :stripe_user_id, :string, default: ""
  end
end

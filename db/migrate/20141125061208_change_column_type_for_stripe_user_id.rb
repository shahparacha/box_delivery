class ChangeColumnTypeForStripeUserId < ActiveRecord::Migration
  def change
    change_column :users, :stripe_user_id, :string
  end
end

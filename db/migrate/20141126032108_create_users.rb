class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :token
      t.string :uid
      t.string "first_name"
      t.string "last_name"
      t.string "photo"
      t.string "stripe_user_id", default: ""
      
      t.timestamps
    end
    add_index :users, :email
    add_index :users, :token
    add_index :users, :stripe_user_id
  end
end

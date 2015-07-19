class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :address

      t.timestamps
    end
  end
end

class DropTableAuthorizations < ActiveRecord::Migration
  def change
    drop_table :authorizations
  end
end

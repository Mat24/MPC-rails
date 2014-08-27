class AddColummsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :is_god, :boolean
    add_column :users, :phone, :string
    add_column :users, :country, :string
  end
end

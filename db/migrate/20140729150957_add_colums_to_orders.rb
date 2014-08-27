class AddColumsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :is_reported, :boolean
  end
end

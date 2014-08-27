class AddColummsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :exp_year, :integer
    add_column :orders, :exp_month, :integer
  end
end

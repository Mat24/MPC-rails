class AddCvvToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cvv, :integer
  end
end

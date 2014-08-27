class AddBillingAddressToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :billing_address, :text
  end
end

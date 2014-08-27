class DeleteColummsToOrders < ActiveRecord::Migration
  def change
    remove_columns :orders, :exp_date
  end
end

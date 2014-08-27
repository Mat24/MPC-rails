class AddOrderIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :order_id, :integer
  end
end

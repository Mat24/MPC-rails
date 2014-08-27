class AddforeingKeyToReports < ActiveRecord::Migration
  def change
    add_index :reports, :order_id
  end
end

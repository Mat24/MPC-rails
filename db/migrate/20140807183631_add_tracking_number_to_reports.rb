class AddTrackingNumberToReports < ActiveRecord::Migration
  def change
    add_column :reports, :tracking_number, :string
  end
end

class AddColummsToReports < ActiveRecord::Migration
  def change
    add_column :reports, :id_user, :integer
  end
end

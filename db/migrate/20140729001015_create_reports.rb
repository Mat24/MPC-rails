class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :date_report
      t.integer :status
      t.string :descriptor
      t.integer :payment
      t.integer :delivery
      t.integer :settled
      t.decimal :commission, precision: 6, scale: 2
      t.string :account_dest

      t.timestamps
    end
  end
end

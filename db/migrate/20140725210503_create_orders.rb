class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :create_date
      t.string :firts_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.date :dob
      t.integer :cc
      t.date :exp_date
      t.integer :routing
      t.string :product
      t.integer :qty
      t.decimal :price
      t.integer :shipping_type

      t.timestamps
    end
  end
end

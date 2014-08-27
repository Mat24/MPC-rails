class Order < ActiveRecord::Base
	belongs_to :user
  has_one :report

  #validates :date, :firts_name, :last_name, :address, :email, :city, :state, :zip, :country, :dob, :cc, :exp_month, :exp_year, :routing, :product, :qty, :price, :shipping_type, :presence => true
end


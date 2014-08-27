json.array!(@orders) do |order|
  json.extract! order, :id, :create_date, :firts_name, :last_name, :address, :email, :city, :state, :zip, :country, :dob, :cc, :exp_year, :exp_month, :routing, :product, :qty, :price, :shipping_type
  json.url order_url(order, format: :json)
end

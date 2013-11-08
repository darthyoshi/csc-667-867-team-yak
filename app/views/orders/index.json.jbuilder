json.array!(@orders) do |order|
  json.extract! order, :order_date, :shipping_address, :shipping_cos
  json.url order_url(order, format: :json)
end

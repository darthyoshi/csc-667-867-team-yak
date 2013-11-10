json.array!(@shoppingcartitems) do |shoppingcartitem|
  json.extract! shoppingcartitem, :artwork_id, :user_id, :quantity
  json.url shoppingcartitem_url(shoppingcartitem, format: :json)
end

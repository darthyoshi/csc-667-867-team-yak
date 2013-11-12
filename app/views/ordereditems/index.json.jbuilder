json.array!(@ordereditems) do |ordereditem|
  json.extract! ordereditem, :order_id, :sold_artwork_id, :quantity, :price, :category, :title, :imagepath, :description, :seller_name, :seller_email
  json.url ordereditem_url(ordereditem, format: :json)
end

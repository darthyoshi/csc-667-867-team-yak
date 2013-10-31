json.array!(@artworks) do |artwork|
  json.extract! artwork, :category, :title, :price, :quantity, :imagepath, :description
  json.url artwork_url(artwork, format: :json)
end

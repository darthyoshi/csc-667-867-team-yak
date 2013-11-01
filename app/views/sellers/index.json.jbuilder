json.array!(@sellers) do |seller|
  json.extract! seller, :displayed_name, :description, :seller_email
  json.url seller_url(seller, format: :json)
end

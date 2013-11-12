json.array!(@sellers) do |seller|
  json.extract! seller, :seller_date, :displayed_name, :seller_description, :seller_email
  json.url seller_url(seller, format: :json)
end

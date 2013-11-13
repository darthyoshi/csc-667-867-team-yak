json.array!(@reviews) do |review|
  json.extract! review, :stars, :user_id, :artwork_id, :review_text, :review_date
  json.url review_url(review, format: :json)
end

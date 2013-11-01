json.array!(@reviews) do |review|
  json.extract! review, :stars, :review_text
  json.url review_url(review, format: :json)
end

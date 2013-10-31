json.array!(@arttags) do |arttag|
  json.extract! arttag, :tagname
  json.url arttag_url(arttag, format: :json)
end

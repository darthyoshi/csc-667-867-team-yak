json.array!(@art_pieces) do |art_piece|
  json.extract! art_piece, :category, :title, :price, :quantity, :image_path, :description
  json.url art_piece_url(art_piece, format: :json)
end

class CategoryController < ApplicationController
  #GET /category/:cat
  def show
    @artworks = Artwork.where("category = ?", params[:cat])
  end
end

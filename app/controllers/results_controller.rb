class ResultsController < ApplicationController
  @artworks
  def search
    @query = params[:search].split(/[\s.]/)
    @artworks = Artwork.where("title = ?", @query[0])
  end

  #GET /category/:cat
  def category
    @artworks = Artwork.where("category = ?", params[:cat])
  end
end

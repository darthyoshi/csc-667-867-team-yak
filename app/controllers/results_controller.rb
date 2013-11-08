class ResultsController < ApplicationController
  @artworks
  @title

  def show
  end

  def search
    @query = params[:search].split(/[\s.]/)
    @artworks = Artwork.where("title = ?", @query[0])
    @title = "Search Results"

    render'show'
  end

  #GET /category/:cat
  def category
    @artworks = Artwork.where("category = ?", params[:cat])
    CATEGORIES.each do |cat,details|
      if details['url'] == request.fullpath
        @title = details['description']
        break
      end
    end

    render 'show'
  end
end

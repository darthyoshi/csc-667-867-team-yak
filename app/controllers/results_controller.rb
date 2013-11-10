class ResultsController < ApplicationController
  @artworks
  @title

  def show
  end

  def search
    page = if params[:page].nil? then 1 else params[:page] end
    @query = params[:search].split(/[\s.]/)
    @artworks = Artwork.where("title = ?", @query[0]).paginate(:page => page, :per_page => 10)
    @title = "Search Results"

    render'show'
  end

  #GET /category/:cat
  def category
    page = if params[:page].nil? then 1 else params[:page] end
    @artworks = Artwork.where("category = ?", params[:cat]).paginate(:page => page, :per_page => 10)
    CATEGORIES.each do |cat,details|
      if details['url'] == request.fullpath
        @title = details['description']
        break
      end
    end

    render 'show'
  end
end

class ResultsController < ApplicationController
  @artworks
  @title

  def show
  end

  def search
    page = if params[:page].nil? then 1 else params[:page] end
    terms = params[:search].split(':')
=begin
    tag_search = Array.new
    title_search = Array.new
    seller_search = Array.new
    desc_search = Array.new

    terms.each_with_index do |term, index|
        if term == "title"
            title_search.push (index + 1)
        elsif term == "tag"
            tag_search.push (index + 1)
        elsif term == "seller"
            seller_search.push (index + 1)
        elsif term == "desc"
            desc_search.push (index + 1)
        end
    end
=end
    @artworks = Artwork.where("id > ?", @query[0]).paginate(:page => page, :per_page => 10)
    @title = "Search Results"

    render'show'
  end

  #GET /category/:cat
  def category
    page = if params[:page].nil? then 1 else params[:page] end
    if params[:cat] != "all"
        @artworks = Artwork.where("category = ?", params[:cat]).paginate(:page => page, :per_page => 10)
    else
        @artworks = Artwork.available.paginate(:page => params[:page], :per_page => 10)
    end
    CATEGORIES.each do |cat,details|
      if request.fullpath.include? details['url']
        @title = "Artworks by category: " + details['description']
        break
      end
    end

    render 'show'
  end
end

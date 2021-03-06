class ResultsController < ApplicationController
#  require 'fuzzystringmatch'

  @artworks
  @title

  def show
  end

  def search
#    jarow = FuzzyStringMatch::JaroWinkler.create(:native)
    page = if params[:page].nil? then 1 else params[:page] end
    terms = params[:search].split(':', 2)

    if terms[0] == "name"
      @artworks = Artwork.where("lower(title) like lower(?)", '%'+terms[1]+'%').order("created_at desc, title asc").paginate(:page => page, :per_page => 10)
    elsif terms[0] == "tag"
      @artworks = Artwork.joins(:taggings, :arttags).distinct.where("lower(tagname) like lower(?)", '%'+terms[1]+'%').order("created_at desc, title asc").paginate(:page => page, :per_page => 10)
    elsif terms[0] == "desc"
      @artworks = Artwork.where("lower(description) like lower(?)", '%'+terms[1]+'%').order("created_at desc, title asc").paginate(:page => page, :per_page => 10)
    elsif terms[0] == "seller"
      @artworks = Artwork.joins(:seller).distinct.where("lower(displayed_name) like lower(?)", '%'+terms[1]+'%').order("created_at desc, title asc").paginate(:page => page, :per_page => 10)
    else
      by_name = Artwork.where("lower(title) like lower(?)", '%'+params[:search]+'%').to_sql
      by_tag = Artwork.joins(:taggings, :arttags).distinct.where("lower(tagname) like lower(?)", '%'+params[:search]+'%').to_sql
      by_desc = Artwork.where("lower(description) like lower(?)", '%'+params[:search]+'%').to_sql
      by_seller = Artwork.joins(:seller).distinct.where("lower(displayed_name) like lower(?)", '%'+params[:search]+'%').to_sql
      
      @artworks = Artwork.find_by_sql(by_name + " UNION " + by_tag + " UNION " + by_desc + " UNION " + by_seller + "ORDER BY created_at desc, title asc").paginate(:page => page, :per_page => 10)
    end

    @title = "Search Results"

    render'show'
  end

  #GET /browse/:cat
  def category
    page = if params[:page].nil? then 1 else params[:page] end
    if params[:cat] != "all"
        @artworks = Artwork.where("category = ?", params[:cat]).order("created_at desc, title asc").paginate(:page => page, :per_page => 10)
    else
        @artworks = Artwork.all.order("created_at desc, title asc").paginate(:page => params[:page], :per_page => 10)
    end
    CATEGORIES.each do |cat,details|
      if request.fullpath.include? details['url']
        @title = "Artworks: " + details['description']
        break
      end
    end

    render 'show'
  end
end

class Artwork < ActiveRecord::Base
  
  validates_presence_of :title
  validates_presence_of :description
  
  validates :quantity, numericality: {greater_than_or_equal_to: 0}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  
  has_many :taggings
  has_many :arttags, :through => :taggings
  
  belongs_to :seller

  has_many :reviews
  has_many :users, :through => :reviews

  #the following line allows to using Artwork.find(id).reviewers
  has_many  :reviewers, :through => :reviews, :source => :user
  
  scope :order_by_id, -> { Artwork.all.order("id ASC")}
  
  # to make this work: Artwork.paint.count
  scope :paint, -> { where(category: 'painting') }
  scope :sculpt, -> { where(category: 'sculpture') }
  
  # to make this work: Artwork.available.count
  scope :available, -> { where("quantity > 0") }
  
  def self.closed_sales
    where("seller_id IS NULL").count
  end
  
  # return the number of artworks whose quantity is curently 0
  def self.sold
    where("quantity = 0").count
  end
  
  # to make this work use: Artwork.created_before(Time.zone.now)
  def self.created_before(time)
      where("created_at < ?", time)
  end
  
  # returns all artworks for a given seller
  def self.by_seller(seller_id)
    Artwork.where("seller_id = ?", seller_id)
  end
  
  # returns all artworks whose quantity is zero
  def self.sold_out(seller_id)
    Artwork.by_seller(seller_id).where("quantity < 1")
  end

  def self.by_arttags(artwork_id)
  end
  
end

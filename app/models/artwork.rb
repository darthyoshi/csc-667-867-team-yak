class Artwork < ActiveRecord::Base
  
  has_many :taggings
  has_many :arttags, :through => :taggings
  
  belongs_to :seller

  has_many :reviews
  has_many :users, :through => :reviews

  #the following line allows to using Artwork.find(id).reviewers
  has_many  :reviewers, :through => :reviews, :source => :user
  
  # to make this work: Artwork.paint.count
  scope :paint, -> { where(category: 'painting') }
  scope :sculpt, -> { where(category: 'sculpture') }
  
  # to make this work: Artwork.available.count
  scope :available, -> { where("quantity > 0") }
  
  # to make this work: Artwork.created_before(Time.zone.now)
  def self.created_before(time)
      where("created_at < ?", time)
  end
  
  def self.by_seller(seller_id)
    Artwork.where("seller_id = ?", seller_id)
  end
  
  def self.sold_out(seller_id)
    Artwork.by_seller(seller_id).where("quantity < 1")
  end

  
  #validates :title, :description, :imagepath, :quantity, :price, :category, :seller_id, :presence => true
  #validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  #validates :imagepath, :format => {
  #  :with => %r{\.(git|jpg|png)$}i,
  #  :message => 'must be a URL for gif, jpg or png image.'
  #}
end

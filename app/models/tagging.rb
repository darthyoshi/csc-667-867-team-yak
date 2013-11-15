class Tagging < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :arttag
end

class Location < ActiveRecord::Base
  MAX_CATEGORIES_DISPLAYED = 5
  validates :name, presence: true, uniqueness: true

  has_many :categories
  has_many :posts
  has_many :images, through: :posts

  def featured_categories
    categories.limit(MAX_CATEGORIES_DISPLAYED)
  end 

  def self.alphabetical
    order(:name)
  end
end

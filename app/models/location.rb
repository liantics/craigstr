class Location < ActiveRecord::Base
  MAX_CATEGORIES_DISPLAYED = 5
  validates :name, presence: true, uniqueness: true

  has_many :categories
  has_many :posts

  def featured_categories
    categories.limit(MAX_CATEGORIES_DISPLAYED)
  end 

  def sort_alphabetically
  end
end

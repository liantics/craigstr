class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  validates :location, presence: true
  validates :price, presence: true

  belongs_to :user
  belongs_to :location
  belongs_to :category

  has_many :post_categories
  has_many :categories, through: :post_categories

  def self.order_by_time
    order("created_at DESC")
  end

  def self.spam
    where(spam: true)
  end
end

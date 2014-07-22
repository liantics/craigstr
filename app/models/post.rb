class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  validates :location, presence: true
  validates :price, presence: true

  belongs_to :user
  belongs_to :location

  def self.order_by_time
    order("created_at DESC")
  end

  has_many :category_tags
  has_many :categories, through: :category_tags
end

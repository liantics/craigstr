class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :location_id, presence: true
  validates :price, presence: true

  belongs_to :user
  belongs_to :location 
end

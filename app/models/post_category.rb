class PostCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :post

  validates :category_id, presence: true
end

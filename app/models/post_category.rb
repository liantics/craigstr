class PostCategory < ActiveRecord::Base
  belongs_to :category, presense: true
  belongs_to :post, presense: true
end

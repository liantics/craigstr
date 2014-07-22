class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true
  validates :location, presence: true
  validates :price, presence: true

  belongs_to :user
  belongs_to :location

  def mark_as_spam
    self.assign_attributes(spam: true)
    self.save
  end

end

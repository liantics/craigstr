class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :posts

  def can_modify?(post)
    admin? || post.user_id == self.id
  end
end

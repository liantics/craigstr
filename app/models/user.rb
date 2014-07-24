class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :posts

  def generate_allowed_posts
    if admin?
      Post.all
    else
      is_post_owner?(post)
    end
  end

  def is_post_owner?(post)
    if post.user_id == self.id
      Post.find(self.id)
    end
  end
end

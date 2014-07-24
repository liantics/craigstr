class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :posts

  def allowed_to_modify_post?(post)
    admin? || post_owner?(post)
  end

  def post_owner?(post)
    if post.user_id == self.id
      Post.find(post.id)
    end
  end
end

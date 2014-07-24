class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :posts

  def allowed_to_modify_post?(post)
    admin? || post_owner?(post)
  end

  private

  def post_owner?(post)
    post.user_id == id
  end
end

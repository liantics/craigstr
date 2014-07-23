class Guest
  def admin?
    false
  end

  def logged_in?
    false
  end

  def posts
    Post.none
  end

  def id
    -1
  end
end

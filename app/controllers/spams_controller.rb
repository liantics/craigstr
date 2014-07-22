class SpamsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    post.update_attributes(:spam => true)

    redirect_to :posts
  end
end

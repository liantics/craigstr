class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new 
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params)

    if @post.save
      redirect_to :posts
    else 
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
    )
  end
end

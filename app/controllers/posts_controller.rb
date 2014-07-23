class PostsController < ApplicationController
  def index
    @posts = Post.order_by_time.page(params[:page])
    @spam = Post.where(spam: true)
    @post = Post.new
    @locations = Location.all
    @categories = Category.all
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to :posts
    else
      @categories = Category.all
      @posts = Post.all
      @locations = Location.all
      render :index
    end
  end

  def update
  end

  def destroy
    if current_user.admin?
      post = Post.find(params[:id])
      post.destroy
    end

    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :price,
      :location_id,
      :category_ids,
    )
  end
end

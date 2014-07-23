class PostsController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update]

  def index
    @posts = Post.order_by_time.page(params[:page])
    @spam = Post.where(spam: true)
    @post = Post.new
    @locations = Location.all
    @categories = Category.all
    @user_posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
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

  def edit
    @post = current_user.posts.find(params[:id])
    @locations = Location.all
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
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
      category_ids: [],
    )
  end
end

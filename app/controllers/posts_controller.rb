class PostsController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update]
  before_action :ensure_user_can_modify_post, only: [:edit, :update]

  def index
    @posts = Post.order_by_time.page(params[:page])
    @spam = Post.where(spam: true)
    @locations = Location.all
    @user_posts = current_user.posts
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
    @spam = Post.where(spam: true)
  end

  def create
    @location = Location.find(params[:location_id])
    @post = current_user.posts.new(post_params.merge(location_id: @location.id))

    if @post.save
      redirect_to @location
    else
      @categories = Category.all
      @posts = Post.all
      @locations = Location.all
      render "locations/show"
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
      category_ids: [],
    )
  end

  def ensure_user_can_modify_post
     post = Post.find(params[:id])
    if post.user_id != current_user.id
      redirect_to :posts
    end
  end
end

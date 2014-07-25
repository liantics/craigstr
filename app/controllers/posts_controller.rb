class PostsController < ApplicationController
  before_action :require_login, only: [:create, :edit, :update]

  def index
    @posts = Post.search(params[:search]) 
    @spam = Post.where(spam: true)
    @locations = Location.all
  end

  def show
    @user = current_user
    @post = Post.find(params[:id])
  end

  def create
    @location = Location.find(params[:location_id])
    @post = current_user.posts.new(post_params.merge(location_id: @location.id))
    @post.title = @post.title.capitalize

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
    @post = Post.find(params[:id])
    if current_user.allowed_to_modify_post?(@post)
      @locations = Location.all
    else
      redirect_to :posts
    end
  end

  def update
    @post = Post.find(params[:id])
    if current_user.allowed_to_modify_post?(@post)
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    else
      redirect_to :posts
    end
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.allowed_to_modify_post?(post)
      post.destroy
      redirect_to :posts
    else
      redirect_to :posts
    end
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
end

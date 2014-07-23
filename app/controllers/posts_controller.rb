class PostsController < ApplicationController
  def index
    @posts = Post.order_by_time.page(params[:page])
    @spam = Post.where(spam: true)
    @post = Post.new 
    @locations = Location.all
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to :posts
    else 
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
    )
  end
end

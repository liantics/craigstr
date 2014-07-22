class PostsController < ApplicationController
  def index
    @posts = Post.all
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
    post = Post.find(params[:id])
    post.update(post_params)
    post.save
    redirect_to :posts
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :price,
      :location_id,
      :spam,
    )
  end
end

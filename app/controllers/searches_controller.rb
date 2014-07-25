class SearchesController < ApplicationController
  def show
    @posts_search_results = Post.where("title ILIKE :search OR body ILIKE :search", search: "%#{params[:search]}%")
  end
end

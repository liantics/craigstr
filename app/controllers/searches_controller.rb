class SearchesController < ApplicationController
  def show
    @posts = run_search
    @found_results = @posts
  end

  private
  
  def run_search
    Post.where("title ILIKE :search OR body ILIKE :search", search: "%#{params[:search]}%")
  end
end

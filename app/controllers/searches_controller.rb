class SearchesController < ApplicationController
  def show
    @found_results= run_search
  end

  private
  
  def run_search
    Post.where("title ILIKE :search OR body ILIKE :search", search: "%#{params[:search]}%")
  end
end

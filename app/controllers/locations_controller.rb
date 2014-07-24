class LocationsController < ApplicationController
  def index
    @locations = Location.order(:name)
    @location = Location.new
    @spam = Post.spam
  end

  def show
    @location = Location.find(params[:id])
    @post = Post.new
    @posts = @location.posts
  end

  def create
    @locations = Location.all
    @location = Location.new(location_params)
    @location.name = @location.name.capitalize
    if @location.save
      redirect_to :locations
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(
      :name
    )
  end
end

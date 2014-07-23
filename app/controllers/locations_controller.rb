class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
    @post = Post.new
    @posts = Post.where(location_id: @location.id)
  end

  def create
    @locations = Location.all
    @location = Location.new(location_params)

    if @location.save
      redirect_to :index
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

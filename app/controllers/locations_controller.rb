class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @location = Location.new
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @locations = Location.all
    @location = Location.new(location_params)

    if @location.save
      redirect_to :locations
    else
      render :index
    end
  end

  def location_params
    params.require(:location).permit(
      :name
    )
  end
end

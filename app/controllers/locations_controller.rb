class LocationsController < ApplicationController
  def index
    @locations = Location.all
    @location = Location.new
  end

  def create
    location = Location.create(location_params)
    location.save
    redirect_to :locations
  end

  def location_params
    params.require(:location).permit(
      :location
    )
  end
end

class CategoriesController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @category = Category.new
  end

  def create
    @location = Location.find(params[:location_id])
    @category = @location.categories.new(category_params)
    @category.name = @category.name.capitalize
    if @category.save
      redirect_to @location
    else
      render :new
    end
  end

  def show
    @location = Location.find(params[:location_id])
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :id,
    )
  end
end

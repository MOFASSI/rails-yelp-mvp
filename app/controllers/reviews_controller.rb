class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params_info)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.valid?
      @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end


  private
  def params_info
    params.require(:review).permit(:content, :rating)
  end
end

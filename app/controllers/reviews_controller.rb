class ReviewsController < ApplicationController

def new
  @restaurant = params[:restaurant_id]
  @restaurant = Restaurant.find(@restaurant)
  @review = Review.new
end

def create
  @restaurant = params[:restaurant_id]
  @restaurant = Restaurant.find(@restaurant)
  @review = Review.new(review_params)
  @review.restaurant_id = params[:restaurant_id]
  if @review.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end

def edit
  @review = Review.find(params[:id])
end

def update
  @review = Review.find(params[:id])
  @review.update(review_params)
  redirect_to review_path(@review)
end

def destroy
  @review = Review.find(params[:id])
  @review.destroy
end

private

def review_params
  params.require(:review).permit(:content, :rating)
end
end

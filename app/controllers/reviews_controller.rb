class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params['id'])
    @review = Review.new
  end
end

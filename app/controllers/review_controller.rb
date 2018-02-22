class ReviewsController < ApplicationController

  before_action :set_booking


  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking

    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new  # renders the new view
    end
  end

  def edit
    @review = @booking.review
  end

  def update
    @review.update(review_params)
    redirect_to bike_path(@booking.bike)
  end

  def destroy
    @review = @booking.review
    @review.destroy
    redirect_to bike_path(@booking.bike)
  end

  def review_params
    params.require(:review).permit(:description, :rate)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end

class ReviewsController < ApplicationController


  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end


  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.bike_id = @booking.bike_id
    @review.booking = @booking
    if @review.save
      redirect_to bike_path(@booking.bike_id)
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

  # def set_booking
  #   @booking = Booking.find(params[:booking_id])
  # end
end

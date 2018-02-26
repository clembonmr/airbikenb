class BookingsController < ApplicationController

  def index
    @booking = Booking.all
  end

  def new
    @bike = Bike.find(params[:bike_id])
    @user = current_user
    @booking = Booking.new

  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    if @booking.save
      redirect_to bike_path(@bike.id)
    else
      render :new  # renders the new view
    end
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to root_path
  end

private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :user_id, :bike_id)
end

end

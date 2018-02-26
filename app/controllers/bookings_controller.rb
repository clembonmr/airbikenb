class BookingsController < ApplicationController

  def index
    @booking = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
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

  def confirm
    @booking = Booking.find(params[:id])
    @booking.status = 1
    @booking.save
    redirect_to booking_path(@booking.id)
  end


  def decline
    @booking = Booking.find(params[:id])
    @booking.status = 2
    @booking.save
    redirect_to booking_path(@booking.id)
  end
private

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :user_id, :bike_id, :status)
end

end

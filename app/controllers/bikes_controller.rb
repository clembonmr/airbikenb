class BikesController < ApplicationController

  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index

    # @bikes = Bike.all
    if params[:location] != nil && params[:location] != ""
       @bikes = Bike.near(params[:location], 500)
       @markers = @bikes.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude
          # infoWindow: { content: render_to_string(partial: "/bikes/map_box", locals: { bike: bike }) }
        }
      end
     else
      @bikes = Bike.where.not(latitude: nil, longitude: nil)
      @markers = @bikes.map do |bike|
        {
          lat: bike.latitude,
          lng: bike.longitude
          # infoWindow: { content: render_to_string(partial: "/bikes/map_box", locals: { bike: bike }) }
        }
      end
    end
  end

  def show
    @reviews = Review.where(bike_id: @bike)
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @bike.update(bike_params)
    redirect_to bikes_path
  end

  def search
  end

  def destroy
    @bike = Bike.find(params[:id])
    @reviews = Review.where()
    @bookings = Booking.where(bike_id: @bike.id )
    @bookings.each do |rev|
      rev.delete
    end
    @bike.delete
    redirect_to bikes_path
  end

  def bike_params
    params.require(:bike).permit(:brand, :category, :location, :description, :photo, :photo_cache, :daily_price, :latitude, :longitude, :user_id, :availability)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end

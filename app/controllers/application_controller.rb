class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :pending?


  def pending?
    @results = []
    @bookings = Booking.where(status: 0)
    @bookings.each do |booking|
      if booking.status == 0
        @bike = Bike.find(booking.bike_id)
         if @bike.user_id == current_user.id
          @results << @bike
        end
      end
    end
    @results == [] ? false : true
  end

  protected



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :photo, :photo_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number, :photo, :photo_cache])
  end


end

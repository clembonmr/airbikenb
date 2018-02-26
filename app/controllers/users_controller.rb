class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @bookings = Booking.all
    # take all the bookings
    # for every booking to check if the owner of the bike that we find from bike_id is equal to @user

  end

end

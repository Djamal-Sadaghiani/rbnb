class ParkingSpaceController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create,]


  def index
    @parking_spaces = ParkingSpace.all
  end

  def new
    @parking_space = ParkingSpace.new
    @user = User.find(params[:user_id])
  end

  def create
    @parking_space = ParkingSpace.new(parking_space_params)
    @user = User.find(params[:user_id])
    if @parking_space.save
      redirect_to user_path(@user)
    else
      render new
    end
  end

  private

  def parking_space_params
    params.require(:parking_space).permit(:adress, :postcode, :city, :country, :latitude, :longitude, :type, :availability, :price_per_hour)
  end

end

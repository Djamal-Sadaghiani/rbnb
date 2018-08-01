class ParkingSpaceController < ApplicationController
  def index
    @parking_spaces = ParkingSpace.all
  end

  def new
    @parking_space = ParkingSpace.new
    @user = User.find(params[:user_id])
  end

  def create
    @parking_space = ParkingSpace.new
    @user = User.find(params[:user_id])
    if @parking_space.save
      redirect_to user_path(@user)
    else
      render new
  end

  private

  def parking_space_params
    params.require(:parking_space).permit(:)
  end

end

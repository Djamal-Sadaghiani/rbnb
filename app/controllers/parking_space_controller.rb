class ParkingSpaceController < ApplicationController
  def index
    @parking_spaces = ParkingSpace.all
  end

  def new
    @parking_space = ParkingSpace.new
  end

  def create

  end

end

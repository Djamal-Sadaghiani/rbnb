class CarsController < ApplicationController

  before_action :set_car, only: [:show, :update, :edit, :destroy]
  before_action :set_user, only: [:create, :destroy]

  def index
    @cars = Car.all
  def

  def show
    #render
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    #render
  end

  def update
    @car(car_params)
  end

  def destroy
    @car.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:license, :brand, :model, :colour)
  end

end

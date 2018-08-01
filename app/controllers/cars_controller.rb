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
    @car.user = current_user
    if @car.save
      redirect_to user_path(@user)
      redirect_to user_cars_path(current_user)
    else
      render :new
    end
   end

   def edit
     #render
  end
   def update
    @car(car_params)
    @car.update(car_params)
    redirect_to user_cars_path(current_user)
  end
   def destroy
    @car.destroy
    redirect_to user_path(@user)
    # user = @car.user
    redirect_to user_cars_path(current_user)
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

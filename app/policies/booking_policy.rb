class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.car_bookings
    end
  end

  def show?
    record.car.user == user
  end

  def new?
    true
  end

  def edit?
    true
  end

  def create?
    true
  end

  def update?
    record.car.user == user
  end

end

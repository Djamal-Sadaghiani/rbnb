class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
  end

  def create?
  end

  def update?
  end

  def show?
  end

end

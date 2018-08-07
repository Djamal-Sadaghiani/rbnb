class PaymentsController < ApplicationController
 before_action :set_booking

  def new
  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @booking.price,
    description:  "Payment for teddy",
    currency:     "€"
    )
    @booking.update(payment: charge.to_json, status: 'paid')
    redirect_to order_path(@booking)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_booking_payment_path(@booking)
    end
  end

private

  def set_booking
    @booking = current_user.car_bookings.where(status: 'pending').find(params[:booking_id])
  end

end

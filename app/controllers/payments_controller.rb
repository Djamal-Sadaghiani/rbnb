class PaymentsController < ApplicationController
 before_action :set_booking
 skip_after_action :verify_authorized

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
    description:  "Payment for your Parkwise Parking Space",
    currency:     "eur"
    )
    @booking.update(payment: charge.to_json, status: 'paid')
    redirect_to bookings_path
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    message = @client.messages.create(
                                     from: 'whatsapp:+14155238886',
                                     body: "Thank you for booking a parking place with Parkwise. The location of your Parking space is https://www.google.com/maps/search/?api=1&query=#{@booking.parking_space.latitude},#{@booking.parking_space.longitude}",
                                     to: 'whatsapp:+4915158581723'
                                   )
    message.sid
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_booking_payment_path(@booking.parking_space, @booking)
    end

private

  def set_booking
    @booking = current_user.car_bookings.where(status: 'pending').find(params[:booking_id])
  end

end

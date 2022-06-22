class CheckoutController < ApplicationController
  def index
  end

  require "stripe"
  Stripe.api_key = "sk_test_51KyEVASEoAbaNhepSIavNhIIPS2RctW77Q04elz1cgPiVyaI0HoRCeFVf1s4JgJpiEjYN4BWQLfik6aV0J41Zcoi00lHnst3PR"

  def create
    if current_user.stripe_id.nil?
      customer = Stripe::Customer.create({ "email": current_user.email })
      #here we are creating a stripe customer with the help of the Stripe library and pass as parameter email.
      current_user.update(:stripe_id => customer.id)
      #we are updating current_user and giving to it stripe_id which is equal to id of customer on Stripe
    end
    @seat_array = params[:seat_id].split
    @quantity = @seat_array.length
    @session = Stripe::Checkout::Session.create({
      success_url: success_url,
      cancel_url: checkout_index_url,
      payment_method_types: ["card"],
      line_items: [{
        name: "Ticket Price",
        amount: 50000,
        currency: "usd",
        quantity: @quantity,
      }],
      mode: "payment",
      metadata: { booking_id: params[:booking_details_id] },
      customer_email: current_user.email,
      success_url: success_url,
      cancel_url: checkout_index_url,
    })

    payload = request.body.read
    sig_header = request.env["HTTP_STRIPE_SIGNATURE"]
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:webhook]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      puts "Signature error"
      p e
      return
    end

    # Handle the event
    case event.type
    when "checkout.session.completed"
      session = event.data.object
      booking = BookingDetail.find_by(id: session.metadata.booking_id)
      booking.update(is_paid: true)
    end

    render json: { message: "success" }

    respond_to do |format|
      format.js
    end
  end

  def success
    @user = current_user
  end

  #require "stripe"
  # Stripe.api_key = "sk_test_51KyEVASEoAbaNhepSIavNhIIPS2RctW77Q04elz1cgPiVyaI0HoRCeFVf1s4JgJpiEjYN4BWQLfik6aV0J41Zcoi00lHnst3PR"

  #   def create
  #     @session = Checkout::Session.create({
  #       success_url: root_url,
  #       cancel_url: checkout_index_url,
  #       line_items: [
  #         { price: 500, quantity: params[:seat_id].length },
  #       ],
  #       mode: "payment",
  #       metadata: { user_id: params[:user_id] },
  #       customer_email: current_user.email,
  #       success_url: root_url,
  #       cancel_url: checkout_index_url,
  #     })

  #     respond_to do |format|
  #       format.js
  #     end
  #   end
end

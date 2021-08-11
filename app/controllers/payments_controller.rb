class PaymentsController < ApplicationController

    skip_before_action :verify_authenticity_token, only: [:webhook]
    def webhook
    payment_id= params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    user_id = payment.metadata.user_id
    p "user id " + user_id
    render plain: "Success"


    end

    def success
    end

end
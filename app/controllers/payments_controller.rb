class PaymentsController < ApplicationController
  
  def create
    return unless logged_in?
    
    if stripe_token = params[:stripe_card][:stripe_token]
      stripe_user = Stripe::Customer.create(
        :card => stripe_token,
        :email => current_user.email
        )
      current_user.update_attribute("stripe_user_id", stripe_user.id) 
    end
  end
  
end
class ChargesController < ApplicationController

  def create
    customer =  Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    customer: customer.id,
    amount: 1500,
    description: "BigMoney Membership - #{current_user.email}",
    currency: 'usd'
    )

    flash[:notice] = "Thanks your payment, #{current_user.email}!"

    current_user.role = "premium"
    current_user.save
    redirect_to wikis_path



  rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to  new_charge_path
   end

   def new
  @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
    description: "BigMoney Membership - #{current_user.email}",
    amount: 1500
  }
  end

  def destroy#downgrade
    current_user.update_attribute(:role, "standard")
    current_user.wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
    redirect_to wikis_path
  end
end

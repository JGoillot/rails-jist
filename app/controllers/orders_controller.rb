class OrdersController < ApplicationController
  def create
    @plan = Plan.find_by(name: "Premium")
    order  = Order.create!(user: current_user, amount: @plan.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end
end

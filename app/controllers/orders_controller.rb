class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart

  def new
    if @cart.line_items.empty?
      redirect_to shop_url, notice: "Your cart is empty."
      return
    end

    @order = Order.new
    @order.user_id = current_user.id
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.add_line_items_from_cart(@cart)
    
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id]= nil
      redirect_to shop_url, notice: "Thanks for ordering from Store Tastic!"
    else
      render :new
    end


  end

private 

def order_params
  params.require(:order).permit(:name, :address, :pay_type, :user_id)
end


end

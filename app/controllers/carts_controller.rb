class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  def edit
  end

  def destroy
    if @cart.destroy
      session[:cart_id] = nil
      flash[:notice] = "Cart successfully deleted"
      redirect_to shop_path
    else
      flash[:alert] = "Couldn't delete your cart."
      redirect_to edit_cart_path
    end
  end

end

# normally we would have   @cart = Cart.find()
class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id) 

    if @line_item.save
      flash[:notice] = "#{product.name} was successfully added to your cart!"
      redirect_to shop_path
    else
      flash.now[:alert] = "Could not add #{product.name} to your cart."
      redirect_to :back
    end
  end
  def destroy
    @line_item = LineItem.find(params[:id])

    if @line_item.present?
      @line_item.destroy
    end
  end


end

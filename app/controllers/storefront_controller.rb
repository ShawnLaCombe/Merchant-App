class StorefrontController < ApplicationController
  def index
    if params[:search]
      @products = Product.search_by_name_or_description(params[:search])
      if @products.empty?
        flash.now[:notice]= "Sorry, we're out of \"#{params[:search]}\", product for now"
        @products = Product.all
      end
    elsif params[:cat_id]
      @category=Category.find(params[:cat_id])
      @products = Product.where(category_id: params[:cat_id])
    else
      @products = Product.all
    end
  end

  def about

  end
end
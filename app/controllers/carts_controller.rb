class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def edit
  end

  def destroy
    if @cart.destroy
      session[:cart_id] = nil
      flash[:notice] = "cart successfully deleted"
      redirct_to shop_path
    else
      flash[:alert] = "couldn't delete cart"
      redirct_to edit_cart_path
    end
  end
end
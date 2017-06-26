class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def create
    # find product and save it - id is in params
    product = Product.find(params[:product_id])
    # build it to line item
    @line_item = @cart.add_product(product.id)

    if @line_item.save
      flash[:notice] = "#{product.name} was added to your cart!"
      redirect_to shop_path
    else
      flash.now[:alert] = "couldn't add item"
      redirect_to :back
    end

  end
end

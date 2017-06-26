class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def subtotal
    #SQL (faster)
    line_items.select("SUM(quantity * price) AS sum")[0].sum
  end

  def add_product(product_id)
    product = Product.find(product_id)
    current_item = line_items.find_by(product_id: product_id)

    if current_item
      #if current item is there, inc quantity by one
      current_item.quantity += 1
    else
      #if  it's not there make a new line item
      current_item = line_items.build(product: product, price: product.price)
    end

   current_item
  end
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

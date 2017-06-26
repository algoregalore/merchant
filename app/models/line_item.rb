class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

    def total_price
      price * quantity
    end
end

# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  product_id :integer
#  cart_id    :integer
#  quantity   :integer          default(1)
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_line_items_on_cart_id     (cart_id)
#  index_line_items_on_product_id  (product_id)
#
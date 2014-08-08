class OrderItem < ActiveRecord::Base

  ## Associations
  # belongs to order
  belongs_to :order
  # represents a product being ordered in an order
  belongs_to :product

  # delegate price to product, ending up with self.per_product_price
  delegate :price, to: :product, prefix: :per_product

  # before save
  # calculate the total order item cost
  before_save do
    self.total_item_price = self.total_cost
  end

  # should be product of product price and quantity
  def total_cost
    per_product_price * quantity
  end



end

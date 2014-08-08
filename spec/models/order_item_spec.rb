require 'rails_helper'

describe OrderItem, :type => :model do

  context 'valid order item' do

    it 'should be valid' do
      # build order item stub
      oi = FactoryGirl.build_stubbed(:order_item)
      # validate
      assert oi.valid?
    end

    it 'should have attrs' do
      product = FactoryGirl.create(:product)
      product.price = 20.00
      oi = product.order_items.build
      assert_equal 20.00, oi.per_product_price
      oi.quantity = 4
      oi.save!
      assert_equal 80.00, oi.total_item_price
    end

    it 'should have methods' do
    end

    it 'should have parent objects' do
    end

    it 'should have children objects' do
    end

  end


  context 'invalid order item' do
  end

end
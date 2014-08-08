require 'rails_helper'

describe Order, :type => :model do

  context 'valid order' do

    let(:order) { FactoryGirl.build_stubbed(:order) }

    it 'should be valid' do
      assert order.valid?
    end

    it 'should have attrs' do
      # check against each factory attr
      assert_equal "Bob", order.first_name
      assert_equal "Smith", order.last_name
      assert_equal "123 Fake St", order.billing_address1
      assert_equal "Grovetown", order.billing_city
      assert_equal "GA", order.billing_state
      assert_equal "30813", order.billing_zipcode
      assert_equal "bob@email.com", order.email_address
      assert_equal "Beware of dog.", order.notes
      assert_equal 20.00, order.amount_paid
      # check methods
      assert_equal "Bob Smith", order.full_name
      assert_equal "Bob Smith", order.customer_name
    end

    it 'should belong to parent objects' do
      # create a parent store
      store = FactoryGirl.create(:store)
      # make order a store order
      order = store.orders.build(order)
      # check store order count on save
      expect{order.save}.to change(store.orders, :count).by 1
    end

    it 'should have children objects' do
    end

    it 'should change status' do
      # create db accessing order
      order = FactoryGirl.create(:order)
      # call confirm method
      order.confirm!
      # check for expected status
      assert_equal 'received', order.status
    end

  end

  context 'invalid order' do

    it 'should not be valid' do
    end

  end

end
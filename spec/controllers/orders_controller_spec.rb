require 'rails_helper'

describe OrdersController, :type => :controller do

  context 'create' do

    it 'should get new, assign order, and create a new order' do
      # get new
      get 'new'
      # check response and assignment
      assert_response :success
      expect(assigns(:order)).not_to be nil
      # get valid order attrs
      order_attrs = FactoryGirl.attributes_for(:order)
      # check post
      expect{post 'create', order: order_attrs}.to change(Order, :count).by 1
    end

  end

  context 'read' do

    let(:order) { FactoryGirl.create(:order) }

    it 'should get index, assign orders' do
      # get index
      get 'index'
      # check response and assignment
      assert_response :success
      expect(assigns(:orders)).to eq [order]
    end

    it 'should get show, assign order' do
      # get show
      get 'show', id: order.to_param
      # check response and assignment
      assert_response :success
      expect(assigns(:order)).to eq order
    end

  end

  context 'update' do

    let(:order) { FactoryGirl.create(:order) }

    it 'should get edit, assign order' do
      # get edit
      get 'edit', id: order.to_param
      # check response and assignment
      assert_response :success
      expect(assigns(:order)).to eq order
    end

    it 'should put update' do
      # update as is
      put 'update', id: order.to_param, order: order.attributes
      # check response for successful save
      assert redirect_to order_path(order.to_param)
    end

  end

  context 'destroy' do

    it 'should destroy an existing order' do
      # create an order to destroy
      order = FactoryGirl.create(:order)
      # delete order
      delete 'destroy', id: order.to_param
      # check response for successful destruction
      assert redirect_to orders_path
    end

  end

end
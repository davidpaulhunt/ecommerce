require 'rails_helper'

describe ProductsController, :type => :controller do

  context 'create' do

    it 'should assign product and create new product' do
      # get the new action
      get 'new'
      assert_response :success
      expect(assigns(:product)).not_to eq nil

      # get valid product attrs
      product_attrs = FactoryGirl.attributes_for(:product)

      # post action should create a new product with valid attrs
      expect{ post 'create', product: product_attrs }.to change(Product, :count).by 1
    end

  end

  context 'read' do

    before(:each) do
      @product = FactoryGirl.create(:product)
    end

    after(:each) do
      @product.destroy!
    end

    it 'should assign product/products and show it/them' do
      # go to product show, assign product
      get 'show', id: @product.id
      assert_response :success
      expect(assigns(:product)).to eq @product
      # go products index, assign products
      get 'index'
      assert_response :success
      expect(assigns(:products)).to eq [@product]
    end

  end

  context 'update' do

    before(:each) do
      @product = FactoryGirl.create(:product)
    end

    after(:each) do
      @product.destroy!
    end

    it 'should update an existing product' do
      # go to edit, assign product
      get 'edit', id: @product.id
      assert_response :success
      expect(assigns(:product)).to eq @product
      # change product name
      @product.name = "New Product Name"
      # update product
      put 'update', id: @product.id, product: @product.attributes
      expect redirect_to product_path(@product.id)
      assert_equal "New Product Name", Product.find(@product.id).name
    end

  end

  context 'destroy' do

    before(:each) do
      @product = FactoryGirl.create(:product)
    end

    after(:each) do
      @product.destroy!
    end

    it 'should destroy an existing product' do
      # destroy product
      expect{ delete 'destroy', id: @product.to_param }.to change(Product, :count).by -1
    end
  end

end
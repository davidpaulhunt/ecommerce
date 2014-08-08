require 'rails_helper'

describe ProductCategoriesController, :type => :controller do

  context 'create' do

    it 'should get new, assign pc, and create new pc' do
      # get new
      get 'new'
      # check response and assignment
      assert_response :success
      expect(assigns(:product_category)).not_to eq nil
      # get valid pc attrs
      pc_attrs = FactoryGirl.attributes_for(:product_category)
      # check post action
      expect{post 'create', product_category: pc_attrs}.to change(ProductCategory, :count).by 1
    end

  end

  context 'read' do

    it 'should get show/index and assign pc/pcs' do
      # create pc
      pc = FactoryGirl.create(:product_category)
      # get show
      get 'show', id: pc.id
      # check response and assignment
      assert_response :success
      expect(assigns(:product_category)).to eq pc
      # get index
      get 'index'
      # check response and assignment
      assert_response :success
      expect(assigns(:product_categories)).to eq [pc]
    end

  end

  context 'update' do

    it 'should get edit, assign pc, and update existing pc' do
      # create pc
      pc = FactoryGirl.create(:product_category)
      # get edit
      get 'edit', id: pc.to_param
      # check response and assignment
      assert_response :success
      expect(assigns(:product_category)).to eq pc
      # change pc attrs
      pc.name = "Changed Product Category Name"
      # put update and check for new product name
      put 'update', id: pc.to_param, product_category: pc.attributes
      assert_equal "Changed Product Category Name", ProductCategory.find(pc.id).name
    end

  end

  context 'destroy' do

    it 'should destroy an existing product category' do
      # create pc
      pc = FactoryGirl.create(:product_category)
      # destroy pc
      expect{ delete 'destroy', id: pc.to_param }.to change(ProductCategory, :count).by -1
    end

  end

end
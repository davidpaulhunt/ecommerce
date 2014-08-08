require 'rails_helper'

describe Store, :type => :model do

  context 'valid store' do

    let(:store) { FactoryGirl.build_stubbed(:store) }
    it 'should be valid' do
      assert store.valid?
    end

    it 'should have attributes' do
      # check each attr
      assert_equal "My Store", store.name
      assert_equal "www.mystore.com", store.web_url
    end

    it 'should belong to a user' do
      # create user to own store
      user = FactoryGirl.create(:user)
      # set valid store attrs
      store_attrs = FactoryGirl.attributes_for(:store)
      # reset store var to user store
      store = user.stores.build(store_attrs)
      # check that user equals store's user
      assert_equal user, store.user
    end

    it 'should have children objects' do
      # save db accessible store
      store = FactoryGirl.create(:store)
      # get children attrs
      product_attrs = FactoryGirl.attributes_for(:product)
      pc_attrs = FactoryGirl.attributes_for(:product_category)
      # build product stub and check association
      product = store.products.build(product_attrs)
      expect{ product.save }.to change(store.products, :count).by 1
      # build product category stub and check association
      pc = store.product_categories.build(pc_attrs)
      expect{ pc.save }.to change(store.product_categories, :count).by 1
      # check dependency
      # save children, check new count
      product.save
      assert_equal 1, Product.count
      pc.save
      assert_equal 1, ProductCategory.count
      # destroy parent store
      store.destroy!
      # check counts
      assert_equal 0, Product.count
      assert_equal 0, ProductCategory.count
    end

  end


  context 'invalid store' do

    it 'should be invalid' do
      # build stub
      store = FactoryGirl.build_stubbed(:store)
      # set store name to nil, validate
      store.name = nil
      assert store.invalid?
      # rebuild store stub
      store = FactoryGirl.build_stubbed(:store)
      # set store web url to nil, validate
      store.web_url = nil
      assert store.invalid?
      # create store, build stub with same attrs
      store = FactoryGirl.create(:store)
      store2 = FactoryGirl.build_stubbed(:store)
      # validate
      assert store2.invalid?
    end

  end
end
require 'rails_helper'

describe Product, :type => :model do

  context 'valid product' do

    it 'should be valid' do
      product = FactoryGirl.build_stubbed(:product)
      assert product.valid?
    end

    it 'should have attrs' do
      product = FactoryGirl.build_stubbed(:product)

      # check each attribute for match to factory attrs
      assert_equal "Racecar", product.name
      assert_equal "1234567789", product.sku
      assert_equal "Ricky Bobby's racecar!", product.short_description
      assert_equal 100000.00, product.price
      assert product.description != nil
    end

    it 'should belong to parent objects' do
      # create parent objects
      store = FactoryGirl.create(:store)
      pc = FactoryGirl.create(:product_category)
      # get valid product attrs
      product_attrs = FactoryGirl.attributes_for(:product)
      # build a store product and check association
      product = store.products.build(product_attrs)
      expect{product.save}.to change(store.products, :count).by 1
      # build a pc product and check association
      product = pc.products.build(product_attrs)
      expect{product.save}.to change(pc.products, :count).by 1
    end

  end

  context 'invalid product' do

    it 'should not be valid' do
      # set product before each test
      # make an attr nil
      # ensure product is then invalid
      
      product = FactoryGirl.build_stubbed(:product)
      product.name = nil
      assert product.invalid?

      product = FactoryGirl.build_stubbed(:product)
      product.sku = nil
      assert product.invalid?

      product = FactoryGirl.build_stubbed(:product)
      product.price = "string"
      assert product.invalid?
    end

  end

end
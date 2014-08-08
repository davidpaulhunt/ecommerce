require 'rails_helper'

describe ProductCategory, :type => :model do

  context 'valid product category' do

    let(:pc) { FactoryGirl.build_stubbed(:product_category) }

    it 'should be valid' do
      assert pc.valid?
    end

    it 'should have attrs' do
      # check each attr
      assert_equal "My Product Category", pc.name
      assert_equal "This is a cool category.", pc.description
    end

    it 'should belong to a store' do
      # create a store
      store = FactoryGirl.create(:store)
      # set valid pc attrs
      pc_attrs = FactoryGirl.attributes_for(:product_category)
      # create a store specific pc
      store_pc = store.product_categories.build(pc_attrs)
      # save and check store.pc count
      expect{store_pc.save}.to change(store.product_categories, :count).by 1
    end

    it 'should have products' do
      # create db accessing pc
      pc = FactoryGirl.create(:product_category)
      # set valid product attrs
      product_attrs = FactoryGirl.attributes_for(:product)
      # build a pc product
      product = pc.products.build(product_attrs)
      # save and check pc.product count
      expect{product.save}.to change(pc.products, :count).by 1
    end

  end

  context 'invalid product category' do

    it 'should not be valid' do
      # stub pc
      pc = FactoryGirl.build_stubbed(:product_category)
      # give invalid name and validate
      pc.name = nil
      assert pc.invalid?
    end

  end

end
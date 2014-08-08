require 'rails_helper'

describe Store, :type => :model do

  context 'valid store' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      store_attrs = FactoryGirl.attributes_for(:store)
      @store = @user.stores.build(store_attrs)
    end

    after(:each) do
      @user.destroy!
    end

    it 'should be valid' do
      assert @store.valid?
    end

    it 'should have attributes' do
      assert_equal @user, @store.user
      assert_equal "My Store", @store.name
      assert_equal "www.mystore.com", @store.web_url
    end

    it 'should belong to a user' do
      # check if user's first store is the only created store
      assert_equal @store, @user.stores.first
    end

  end


  context 'invalid store' do

    let(:store_attrs) { FactoryGirl.attributes_for(:store) }

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    after(:each) do
      @user.destroy!
    end

    it 'should be invalid' do
      store = @user.stores.build(store_attrs)
      store.name = nil
      assert store.invalid?

      store = @user.stores.build(store_attrs)
      store.web_url = nil
      assert store.invalid?

      store = @user.stores.create(store_attrs)

      store2 = @user.stores.build(store_attrs)
      assert store2.invalid?
    end

  end
end
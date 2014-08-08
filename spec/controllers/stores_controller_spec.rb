require 'rails_helper'

describe StoresController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  context 'create' do

    it 'should create a new store' do
      # get the new store page
      get 'new'
      assert_response :success
      expect(assigns(:store)).not_to eq nil
      
      # set valid store attrs for post
      store_attrs = FactoryGirl.attributes_for(:store)
      store_attrs[:user_id] = user.id

      # make sure a post creates a new store
      expect{ post :create, store: store_attrs }.to change(Store, :count).by 1
    end

  end

  context 'read' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      store_attrs = FactoryGirl.attributes_for(:store)
      @store = @user.stores.create(store_attrs)
    end

    after(:each) do
      @user.destroy!
      @store.destroy!
    end

    it 'should assign store/stores and assign store/stores' do
      # show an existing store
      get 'show', id: @store.id
      assert_response :success
      expect(assigns(:store)).to eq @store

      # create another valid store
      store2 = @user.stores.build
      store2.name = "Store 2"
      store2.web_url = "www.store2.com"
      store2.save

      # get all stores
      get 'index'
      assert_response :success
      expect(assigns(:stores)).to eq [@store, store2]
    end
  end

  context 'update' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      store_attrs = FactoryGirl.attributes_for(:store)
      @store = @user.stores.build(store_attrs)
      @store.save
    end

    after(:each) do
      @user.destroy!
      @store.destroy!
    end

    it 'should update an existing store' do
      # get the edit page
      get 'edit', id: @store.id
      assert_response :success
      expect(assigns(:store)).to eq @store

      # change vars name for update
      old_name = @store.name
      @store.name = "New Store Name"

      # update existing store's name
      put 'update', id: @store.id, store: @store.attributes
      expect redirect_to store_path(@store.id)
      assert_equal "New Store Name", Store.find(@store.id).name
    end

  end

  context 'destroy' do

    before(:each) do
      @user = FactoryGirl.create(:user)
      store_attrs = FactoryGirl.attributes_for(:store)
      @store = @user.stores.build(store_attrs)
      @store.save
    end

    after(:each) do
      @user.destroy!
      @store.destroy!
    end

    it 'should destroy an existing store' do
      expect{ delete 'destroy', id: @store.id }.to change(Store, :count).by -1
    end
  end

end
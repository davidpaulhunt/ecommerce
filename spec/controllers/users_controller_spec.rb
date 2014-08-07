require 'rails_helper'

describe UsersController, :type => :controller do

  context 'create' do

    it 'should create a user' do
      get 'new'
      assert_response :success

      user_attrs = FactoryGirl.attributes_for(:user)

      expect{ post :create, user: user_attrs }.to change(User, :count).by 1
      expect redirect_to login_path
    end
  end

  context 'read' do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    after(:each) do
      @user.destroy!
    end

    it 'should assign user/users and show it/them' do
      # show a user
      get 'show', id: @user.id
      assert_response :success
      expect(assigns(:user)).not_to be_nil

      # show all users
      get 'index'
      assert_response :success
      expect(assigns(:users)).to eq [@user]
    end

  end

  context 'update' do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    after(:each) do
      @user.destroy!
    end

    it 'should update a user\'s attributes' do
      get 'edit', id: @user.id
      assert_response :success
      expect(assigns(:user)).to eq @user

      previous_email = @user.email
      put 'update', id: @user.id, user: {email: "bob_smith@email.com"}
      expect redirect_to user_path(@user.id)
    end
  end

  context 'destroy' do
    it 'should destroy a user from database' do
      @user = FactoryGirl.create(:user)
      expect{ delete 'destroy', id: @user.id }.to change(User, :count).by -1
    end
  end

end
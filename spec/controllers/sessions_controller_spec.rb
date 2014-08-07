require 'rails_helper'

describe SessionsController, :type => :controller do

  let(:user) { FactoryGirl.create(:user) }

  context 'sign in' do
    it 'should sign a valid user in and send them to index' do
      get 'new'
      assert_response :success
      login(user)
      assert_response :success
      expect redirect_to users_path
    end
  end

end

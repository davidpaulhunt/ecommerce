require 'rails_helper'

describe User, :type => :model do

  context 'valid user' do
    it 'should be valid' do
      user = FactoryGirl.build_stubbed(:user)
      assert user.valid?
    end
    
    it 'should have attributes' do
      user = FactoryGirl.build_stubbed(:user)
      
      # check each attribute
      assert_equal "Bob", user.first_name
      assert_equal "Smith", user.last_name
      assert_equal "bob@email.com", user.email
      assert_equal "password", user.password
      assert_equal "password", user.password_confirmation
    end
  end

  context 'invalid user' do
    it 'should be invalid' do
      # empty user should be invalid
      user = User.new
      assert user.invalid?

      user = FactoryGirl.create(:user)
      
      # build second user using same info to check for uniqueness
      user2 = FactoryGirl.build_stubbed(:user)
      assert user2.invalid?
    end
    
    it 'should fail through validations' do
      user_attrs = FactoryGirl.attributes_for(:user)
      
      # validate email presence
      user = User.new(user_attrs)
      user.email = nil
      assert user.invalid?
      
      # validate password, confirm presence
      user = User.new(user_attrs)
      user.password = nil
      user.password_confirmation = nil
      assert user.invalid?
      
      # validate confirmation of password
      user = User.new(user_attrs)
      user.password_confirmation = "wrongpassword"
      assert user.invalid?
    end
  end

end
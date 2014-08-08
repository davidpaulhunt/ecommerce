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

    it 'should have children objects' do
      # create a user
      user = FactoryGirl.create(:user)
      # get valid store attrs
      store_attrs = FactoryGirl.attributes_for(:store)
      # build store stub and check association
      store = user.stores.build(store_attrs)
      expect{store.save}.to change(user.stores, :count).by 1
      # save store to build product
      store.save!
      # get valid product attrs
      product_attrs = FactoryGirl.attributes_for(:product)
      # build product stub and check association
      product = store.products.build(product_attrs)
      expect{product.save}.to change(user.products, :count).by 1
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
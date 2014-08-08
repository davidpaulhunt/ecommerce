class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :email, :password
  validates_confirmation_of :password

  has_many :stores
  has_many :products, through: :stores
  
end

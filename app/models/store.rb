class Store < ActiveRecord::Base

  belongs_to :user

  has_many :products, dependent: :destroy
  has_many :product_categories, dependent: :destroy

  has_many :orders

  validates_presence_of :name, :web_url
  validates_uniqueness_of :name, :web_url
end

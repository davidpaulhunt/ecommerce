class Product < ActiveRecord::Base

  validates_presence_of :name, :sku
  validates_numericality_of :price, allow_blank: true

  belongs_to :store
  belongs_to :product_category

  has_many :order_items

end

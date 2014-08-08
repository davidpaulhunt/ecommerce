class ProductCategory < ActiveRecord::Base

  belongs_to :store
  has_many :products

  validates_presence_of :name

end

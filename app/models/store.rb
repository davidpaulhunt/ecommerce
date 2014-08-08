class Store < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :name, :web_url
  validates_uniqueness_of :name, :web_url
end

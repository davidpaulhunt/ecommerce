class Order < ActiveRecord::Base

  require_dependency 'order/actions'

  belongs_to :store

  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items, allow_destroy: true, :reject_if => Proc.new { |a| a['ordered_item_id'].blank? }

  has_many :products, through: :order_items




  # methods

  def full_name
    "#{first_name} #{last_name}"
  end

  def customer_name
    company.blank? ? full_name : "#{company} (#{full_name})"
  end

end

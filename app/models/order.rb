class Order < ApplicationRecord
  has_one :shippig_type
  belongs_to :user
  has_many :line_items
  has_many :transitions

  def full_cost
    line_items.map { |e| e.full_price }.sum + shipping_cost
  end
end

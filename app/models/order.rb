class Order < ApplicationRecord
  belongs_to :shippig_type
  belongs_to :user
  has_many :line_items

  def full_cost
    line_items.map {|e| e.full_price}.sum + shipping_cost
  end
end

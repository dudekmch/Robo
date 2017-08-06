class LineItem < ApplicationRecord
  has_one :product
  belongs_to :order

  def full_price
    unit_price * quantity
  end
end

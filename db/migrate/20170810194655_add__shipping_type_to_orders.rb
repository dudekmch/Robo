class AddShippingTypeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :shipping_type, foreign_key: true
  end
end

class RemoveShippigTypeFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :shippig_type, foreign_key: true
  end
end

class RemoveShippigTypesFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_reference :orders, :shippig_types, foreign_key: true
  end
end

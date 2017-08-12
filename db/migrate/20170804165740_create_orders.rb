class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :shipping_type, foreign_key: true
      t.decimal :shipping_cost
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end

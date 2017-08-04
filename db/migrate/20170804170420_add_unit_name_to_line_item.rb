class AddUnitNameToLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :unit_name, :string
  end
end

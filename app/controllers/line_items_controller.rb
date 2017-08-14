class LineItemsController < ApplicationController
  def show_order_items
    @order = Order.find(params[:id])
    @line_items = LineItem.where(order: @order)
  end
end

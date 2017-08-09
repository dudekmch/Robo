class SummaryController < ApplicationController
  def show_summary
    order = Order.find(session[:order_id])
    @line_items = order.line_items
    @address = order.user.address
  end
end

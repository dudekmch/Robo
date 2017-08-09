class SummaryController < ApplicationController
  def show_summary
    @user = User.find(params[:user_id])
    @line_items = @user.orders.last.line_items
    @address = @user.address
  end
end

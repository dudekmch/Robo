class SummaryController < ApplicationController
  def show_summary
    @user = User.find(params[:user_id])
    @order = current_cart
  end
end

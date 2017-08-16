class SummaryController < ApplicationController
  def show
    @user = User.find(params[:id])
    @order = current_cart
  end

  def order_confirmation
    order = current_cart
    user = current_user
    order.user = user
    order.save
    session.delete(:order_id)
    redirect_to root_path, notice: 'Dziękujemy za złozenie zamówienia !'
  end
end

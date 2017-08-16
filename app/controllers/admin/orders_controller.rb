class Admin::OrdersController < Admin::BaseController
  def index
    @search = Order.search(params[:q])
    @orders = @search.result.page(params[:page]).per(15)
  end

  def show
    @order = Order.find(params[:id])
    @line_items = @order.line_items
  end

  def update
    @order = Order.find(params[:id])
    @order.transition_to! params[:state]
    redirect_to admin_orders_path, notice: 'Pomyślnie zmieniono status zamówienia'
  end
end

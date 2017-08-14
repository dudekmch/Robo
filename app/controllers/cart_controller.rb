class CartController < ApplicationController
    before_action :current_cart, only: 'show'

  def index
    @search = Order.where(user: current_user).search(params[:q])
    @orders = @search.result.page(params[:page]).per(30)
  end

  def show
    get_order_data
  end

  def collect
    get_order_data
  end

  def edit
    @cart = current_cart
  end

  def add_product
    order = current_cart_or_create
    product = Product.find(params[:id])
    if item = order.line_items.where(product: product).first
      item.quantity += 1
      item.save
    else
      order.line_items.create product: product,
      quantity: 1,
      unit_price: product.price,
      unit_name: product.name
    end
    redirect_to :back, notice: "Produkt #{product.name} dodano do koszyka"
  end

  def remove_product
    order = current_cart
    product = Product.find(params[:product_id])
    item = order.line_items.where(product: product).first
    if item
      item.destroy
    end
    redirect_to :back, notice: 'Usunięto produkt z koszyka'
  end

  def add_shipping_type_to
    order = current_cart
    shipping = ShippingType.find(params[:shipping_id])
    order.shipping_type = shipping
    order.shipping_cost = shipping.cost
    order.save
    redirect_to collect_cart_path, notice: 'Dodano rodzaj dostawy'
  end

  private

  def get_order_data
    @cart = Order.find(params[:id])
    @shippings = ShippingType.all
  end
end

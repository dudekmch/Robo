class CartController < ApplicationController
  def show
    @cart = current_cart
    @shippings = ShippingType.all
  end

  def edit
    @cart = current_cart
  end

  def confirmation
  end

  def add_product
    order = current_cart_or_create
    product = Product.find(params[:product_id])
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
    redirect_to cart_path, notice: 'Dodano rodzaj dostawy'
  end
end

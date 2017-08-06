class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
  helper_method :current_cart

  def current_cart
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_cart_or_create
    cart = current_cart
    if cart.new_record?
      cart.save
      session[:order_id] = cart.id
    end
    cart
  end

  private

  def layout_by_resource
    if devise_controller?
      'content'
    else
      'application'
    end
  end
end

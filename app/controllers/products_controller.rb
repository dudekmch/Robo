class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(12)
  end

  def show
  end
end

class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(12)
  end

  def show
    @product = Product.find(params[:id])
    @category = @product.category
  end
end

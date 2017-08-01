class Admin::ProductsController < Admin::BaseController
  def index
    @search = Product.search(params[:q])
    @products = @search.result.page(params[:page]).per(30)
  end

  def new
    @product = Product.create()
  end

  def create
      @product=Product.create(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Pomyslnie dodano product'
    else
      render action: :new
    end  
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to admin_products_path, notice: 'Pomyslnie zmieniono produkt'
    else
      render action: :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path, notice: 'Pomyślnie usunięto produkt'
  end
  
private

  def product_params
    params.require(:product).permit(
      :name,
      :category_id,
      :description,
      :long_description,
      :price,
      :photo
    )  
  end
end

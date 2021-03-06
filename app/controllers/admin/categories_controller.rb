class Admin::CategoriesController < Admin::BaseController
  def index
    @search = Category.search(params[:q])
    @categories = @search.result
  end

  def new
    @category = Category.create
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Pomyslnie dodano kategorie'
    else
      render action: :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_categories_path, notice: 'Pomyslnie zmieniono kategorie'
    else
      render action: :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.products.size.zero?
      @category.destroy
      redirect_to admin_categories_path, notice:
      "Pomyślnie usunięto kategorie #{@category.name}"
    else
      redirect_to admin_categories_path, alert:
      "W #{@category.name} znajdują się produkty, usuń je przed usunięciem kategorii"
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end

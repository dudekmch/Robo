class Admin::CategoriesController < Admin::BaseController
    def index
    @categories = Category.all
  end

  def new
    @categories = Category.create()
  end

  def create
      @categories=Category.create(category_params)
    if @categories.save
      redirect_to admin_categories_path, notice: 'Pomyslnie dodano kategorie'
    else
      render action: :new
    end  
  end

  def edit
    @categories = Category.find(params[:id])
  end

  def update
    @categories = Category.find(params[:id])
    if @categories.update_attributes(category_params)
      redirect_to admin_categories_path, notice: 'Pomyslnie zmieniono kategorie'
    else
      render action: :edit
    end
  end

private

  def category_params
    params.require(:category).permit(
      :name
    )  
  end
end

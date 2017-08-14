class Admin::UsersController < Admin::BaseController
  def index
    @search = User.search(params[:q])
    @users = @search.result.page(params[:page]).per(30)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to admin_users_path, notice: 'Pomyślnie zaktualizowano uzytkownika'
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :admin
    )
  end
end

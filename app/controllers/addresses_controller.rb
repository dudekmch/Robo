class AddressesController < ApplicationController
  def new
    @address = Address.create
  end

  def create
    @address = Address.create(address_params)
    if !@address.new_record?
      current_user.update(address: @address)
      redirect_to show_summary_summary_path(current_user), notice: 'Poprawnie zapisano adres'
    else
      render action: :new
    end
  end

  def show
    @address = Address.find(params[:id])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(address_params)
      redirect_to show_summary_summary_path(user_id: current_user.id)
    else
      render action: :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :first_name,
      :last_name,
      :city,
      :zip_code,
      :street
    )
  end
end
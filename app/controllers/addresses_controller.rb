class AddressesController < ApplicationController
  def new
    @address = Address.create
  end

  def create
    @address = Address.create(address_params)
    if @address.save?
      redirect_to "#", notice: 'Poprawnie zapisano adres'
    else
      render action: :new
    end
  end

  def show
    @address = Address.find(params[:adress_id])
  end

  def edit
  end

  def update
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
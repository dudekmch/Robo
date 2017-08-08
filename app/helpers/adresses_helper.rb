module AdressesHelper
  def full_name(address)
    names = [address.last_name, address.first_name]
    names.join(' ')
  end

  def city_zipcode(address)
    data = [address.city, address.zip_code]
    data.join(' ')
  end
end

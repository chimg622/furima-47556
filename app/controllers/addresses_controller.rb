class AddressesController < ApplicationController
  def create
    @address = Address.create(address_params)
  end

  private
  
  def address_params
    params.require(:address).permit(:post_number, :prefecture_id, :city, :address, :building, :phone_number)
end

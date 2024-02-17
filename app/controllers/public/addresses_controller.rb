class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    
    @address = Address.new
    @addresses = current_customer.addresses.all
    
  end

def create
   @address = current_customer.addresses.new(address_params)

  if @address.save
    redirect_to addresses_path
  else
    @addresses = Address.all
    render :index 
  end
end
  
  def destoroy
    
    address = Address.find(params[:id])
    
    address.destroy
    
    redirect_to addresses_path
    
  end
 
  def edit
    
    @address = Address.find(params[:id])
    
  end
  
  def update
    
     @address = Address.find(params[:id])
     
     @address.update(address_params)

     redirect_to addresses_path
    
  end
  
  private
  
  def address_params
    
     params.require(:address).permit(:addressee_name, :address_area, :postal_code, :customer_id )
    
  end
  
end

class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!
  def new
    
    @order = Order.new
    
    @addresses = current_customer.addresses.all
    
    @customer = current_customer
    
    
    
  end
  
  def error
  # confirmがPOSTメソッドの為リロードをした時errorアクションが起動
    redirect_to new_order_path
    
  end
  
  def confirm
    
     if params[:order].present?
       
       @order = Order.new
       
     else
      
      return render :new
     end
     
     @order.payment_method = params[:order][:payment_method]
     
     @order.customer_id = current_customer.id
     
     
     @cart_items = current_customer.cart_items.all
     
     
     address_option = params[:order][:address_option]
     
     case address_option
     
     when "0"
       
       @order.postal_code = current_customer.postal_code
       
       @order.address_area = current_customer.address
       
       @order.addressee_name = current_customer.last_name + current_customer.first_name
       
      
       
      when "1"
       
       @address = Address.find(params[:order][:address_id])
       
        @order.postal_code = @address.postal_code
        
        @order.address_area = @address.address_area
        
        @order.addressee_name = @address.addressee_name
        
      when "2"
       
       @order.postal_code = params[:order][:postal_code]
       
       @order.address_area = params[:order][:address_area]
       
       @order.addressee_name = params[:order][:addressee_name]
       
     end   
     

    
  end
  
  def decision
      
      @order = Order.new(order_params)

      @order.customer_id = current_customer.id
      
      @order.save
      
    #   カートアイテムをorder_detailに移動
      @cart_items = current_customer.cart_items.all
      
      @cart_items.each do |cart_item|
      
      @order_detail = OrderDetail.new
      
      @order_detail.item_id = cart_item.item_id
      
      @order_detail.quantity = cart_item.amount
      
      @order_detail.tax_included_price = cart_item.item.with_tax_price
      
      @order_detail.order_id = @order.id
      
      @order_detail.save
      
      end
      
      current_customer.cart_items.destroy_all
      
      redirect_to complete_path
       
  end

  def complete
      
      
      
  end

  def index
      
      @orders = current_customer.orders.all
      
      
  end

  def show
      
      @order = current_customer.orders.find(params[:id])
      @order_details = @order.order_details.all
  end
  
  private
  
  def order_params
    
    params.require(:order).permit(:payment_method, :customer_id, :postal_code, :address_area, :addressee_name, :address_id, :address_option, :shipping_cost, :payment_amount)
    
  end
  
end

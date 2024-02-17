class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!
  def show
    
    @order = Order.find(params[:id])
    
    @order_details = @order.order_details.all
    
    @order_detail = OrderDetail.new
    
  end
  
  def update
      
    @order = Order.find(params[:id])
    
    @order.update(order_params)
    
    @order_details = @order.order_details.all
    
    if params[:order][:order_status] == "入金確認"
      
      @order_details.each do |order_detail|
      order_detail.update(making_status: "製作待ち")
      end
      
    end 
    redirect_to admin_order_path(@order)  
      
  end
  
  
  
  private
  
  def order_params
    
     params.require(:order).permit(:order_status)      
      
  end
      
  
  
end

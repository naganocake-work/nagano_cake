class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    
    @customer = current_customer
    
  end

  def edit
  end

  def confirm
  end
  
  def disable
    
  @customer = current_customer
  @customer.update(is_active: false)
  reset_session
  flash[:notice] = "退会処理を実行いたしました"
  redirect_to root_path
  end  
end

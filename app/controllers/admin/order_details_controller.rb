class Admin::OrderDetailsController < ApplicationController
   before_action :authenticate_admin!

   def update

    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)



    if params[:order_detail][:making_status] == "製作中"

        @order.update(order_status: "製作中" )
    end
   #  製作ステータスが全て製作完了の時発送準備中に変更
    @order_details = @order.order_details
   #  totalとorder_totalを定義
    total = 0
    order_total = 0
    @order_details.each do |order_detail|

       total += 1

    if order_detail.making_status == "製作完了"

       order_total += 1

    end

    end
   #  totalとorder_totalの数が同じの時発送準備中に変更
    if  total == order_total

       @order.update(order_status: "発送準備中" )

    end
    redirect_to admin_order_path(@order)
   end
  # ここまで #

   private

   def order_detail_params

       params.require(:order_detail).permit(:making_status)

   end

end

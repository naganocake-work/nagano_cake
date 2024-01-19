class Admin::OrdersDetailsController < ApplicationController
   before_action :authenticate_admin!
end

class ChanegeAddressToAddressAreaInOrders < ActiveRecord::Migration[6.1]
  def change
    
     rename_column :orders, :address, :address_area
    
  end
end

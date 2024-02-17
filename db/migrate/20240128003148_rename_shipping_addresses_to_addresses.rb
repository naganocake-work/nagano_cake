class RenameShippingAddressesToAddresses < ActiveRecord::Migration[6.1]
  def change
    
    rename_table :shipping_addresses, :addresses
    
  end
end

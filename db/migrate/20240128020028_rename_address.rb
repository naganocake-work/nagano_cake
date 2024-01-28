class RenameAddress < ActiveRecord::Migration[6.1]
  def change
    
     rename_column :addresses, :address, :address_area
    
  end
end

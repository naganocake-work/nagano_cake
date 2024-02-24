class Public::ItemsController < ApplicationController
def index
  if params[:item_name].present?
    @items = Item.where("name LIKE ?", "%#{params[:item_name]}%").page(params[:page])
  elsif params[:genre_name].present?
    @genre = Genre.find_by(name: params[:genre_name])
    @items = @genre.items.page(params[:page])
  else
    @items = Item.page(params[:page])
  end
  
  @genres = Genre.all
  
end
  

  def show
    
    @genres = Genre.all

    @item = Item.find(params[:id])
    
    @cart_item = CartItem
    
  end

end

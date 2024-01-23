class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!

  def index

    @items = Item.all

  end

  def new

    @item = Item.new

  end

def create
  @item = Item.new(item_params)

  if @item.save
    redirect_to admin_item_path(@item.id)
  else
    @errors = @item.errors.full_messages
    render :new
  end
end

  def show
  end

  def edit
  end

  private

  def item_params

    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id)
  end

end

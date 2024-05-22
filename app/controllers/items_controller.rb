class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_details, :category_id, :state_id, :price, :postage_id, :prefecture_id,
                                 :shipping_date_id, :image).merge(user_id: current_user.id)
  end
end

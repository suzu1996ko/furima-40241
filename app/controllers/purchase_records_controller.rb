class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchase_record.nil?
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building_name,
                                             :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token]) 
  end
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: Item.find(params[:item_id]).price,
    card: purchase_params[:token],
    currency: 'jpy'
  )
end

class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefectures, :municipality, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase != nil
      redirect_to root_path
    end
  end
end
class ItemsController < ApplicationController
  def index
  end

  def new
    authenticate_user!
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to :root
    else
      render new_item_path
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :price, :text, :category_id, :status_id, :deli_price_id, :area_id, :deli_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end

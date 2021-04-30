class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :price, :text, :category_id, :status_id, :deli_price_id, :area_id, :deli_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    if current_user.id != @user.id
      redirect_to action: :index
    end
  end

end

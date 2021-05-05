class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :move_to_index, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(:image, :name, :price, :text, :category_id, :status_id, :deli_price_id, :area_id, :deli_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @item.user.id || !@item.purchase.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

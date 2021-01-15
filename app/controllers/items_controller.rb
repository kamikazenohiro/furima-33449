class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
    item.destroy
    redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :describe, :price, :category_id, :condition_id, :shipping_fee_id,
                                 :prefecture_id, :delivery_day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_back(fallback_location: root_path)
    end
  end
end

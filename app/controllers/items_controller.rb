class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :delivery_day_id).merge(user_id: current_user.id)
  end

end
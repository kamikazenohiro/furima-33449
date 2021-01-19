class ItemsBuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item_buy, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(items_buy_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_item_buy
    @item = Item.find(params[:item_id])
  end

  def items_buy_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipalities, :block_number, :building_name,
                                  :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
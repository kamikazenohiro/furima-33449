class ItemsBuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  #before_action :sold_out_item, only: [:index]
  before_action :set_item_buy, only: [:index, :create]

  def index
    @order = Order.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @order = Order.new(items_buy_params)
    if @order.valid?
      pay_items_buy
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
                                  :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_items_buy
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: items_buy_params[:token],
      currency:'jpy'
    )
 end

  #def sold_out_item
  #  redirect_to root_path if @item.items_buy.present?
  #end

end
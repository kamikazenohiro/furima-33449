class ItemsBuysController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    #binding.pry
    @order = Order.new(items_buy_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def items_buy_params
    params.require(:order).permit(:postal_code, :prefecture, :municipalities, :block_number, :building_name, :phone_number, :items_buy_id)
  end

end
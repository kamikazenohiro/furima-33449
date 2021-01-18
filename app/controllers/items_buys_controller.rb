class ItemsBuysController < ApplicationController

  def index
    @order = Order.new
  end

end

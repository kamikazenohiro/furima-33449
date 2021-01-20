require 'rails_helper'
RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'トークンと各情報が存在すれば商品購入できる' do
        expect(@order).to be_valid
      end
    end
  end
end

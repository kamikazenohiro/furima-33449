require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it '各情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it '価格が300〜9,999,999であれば登録できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかないとき' do

    end
  end
end

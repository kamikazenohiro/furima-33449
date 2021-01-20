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
      it 'ビル名は空でも商品購入できる' do
        @order.building_name = nil
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'ユーザーの情報が必須であること' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'アイテムの情報が必須であること' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが必須であること' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が必須であること' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが必須であること' do
        @order.postal_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県の選択が必須であること' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture Select")
      end
      it '市区町村が必須であること' do
        @order.municipalities = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が必須であること' do
        @order.block_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が必須であること' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が英数混合では登録できないこと' do
        @order.phone_number = '090a1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号にハイフンは不要であること' do
        @order.phone_number = '0000-00-000'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

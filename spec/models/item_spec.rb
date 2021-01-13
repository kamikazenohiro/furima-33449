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
    end

    context '商品出品登録がうまくいかないとき' do
      it '出品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.describe = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it 'カテゴリーのプルダウンで---以外の選択が必須であること' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態のプルダウンで---以外の選択が必須であること' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end
      it '配送料の負担のプルダウンで---以外の選択が必須であること' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 0")
      end
      it '発送元の地域のプルダウンで---以外の選択が必須であること' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数のプルダウンで---以外の選択が必須であること' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end
      it '価格が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格が300未満でないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9999999を超えてないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '価格に全角が混ざってないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格に半角英字が混ざってないこと' do
        @item.price = '300a300'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '価格に半角記号が混ざってないこと' do
        @item.price = '300@300'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end

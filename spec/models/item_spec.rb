require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'すべての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explainが空だと登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it 'categry_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが１だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'condition_idが１だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shopping_change_idが空では登録できない' do
        @item.shopping_change_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping change can't be blank")
      end
      it 'shopping_change_idが１だと登録できない' do
        @item.shopping_change_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping change must be other than 1')
      end
      it 'current_place_idが空では登録できない' do
        @item.current_place_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Current place can't be blank")
      end
      it 'current_place_idが１だと登録できない' do
        @item.current_place_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Current place must be other than 1')
      end
      it 'send_day_idが空では登録できない' do
        @item.send_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Send day can't be blank")
      end
      it 'send_day_idが１だと登録できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Send day must be other than 1')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300以下であること' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '価格の範囲が、¥10,000,000であること' do
        @item.price = 10, 0o00, 0o00
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it '販売価格は半角数字でないと登録できない' do
        @item.price = '１００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end

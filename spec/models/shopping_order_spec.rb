require 'rails_helper'

RSpec.describe ShoppingOrder, type: :model do
  before do
    @shopping = FactoryBot.build(:shopping_order)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての情報が存在すれば登録できる' do
        expect(@shopping).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_numberが空だと登録できない' do
        @shopping.post_number = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号に-がないと登録できない' do
        @shopping.post_number = '1234567'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include ("Post number is invalid")
      end
      it 'current_place_idが空では登録できない' do
        @shopping.current_place_id = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Current place can't be blank")
      end
      it 'current_place_idが１だと登録できない' do
        @shopping.current_place_id = 1
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Current place must be other than 1")
      end
      it 'cityが空では登録できない' do
        @shopping.city = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空だと登録できない' do
        @shopping.street_number = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Street number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @shopping.phone_number = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに-があると登録できない' do
        @shopping.phone_number = '090-123-456'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include ("Phone number is invalid")
      end
      it 'phone_numberが12桁以上だと登録できない' do
        @shopping.phone_number = '012345678912345'
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include ("Phone number is invalid")
      end
      it 'tokenが空だと登録できない' do
        @shopping.token = ''
        @shopping.valid?
        expect(@shopping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

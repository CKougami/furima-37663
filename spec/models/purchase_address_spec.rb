require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    context '購入登録できる場合' do
      it 'すべての項目が正しく入力されていれば登録できる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも登録できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入登録できない場合' do
      it 'postal_codeが空では登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに「-」がないと登録できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'shipping_area_idを選択しないと登録できない' do
        @purchase_address.shipping_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空では登録できない' do
        @purchase_address.tel = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが9桁以下では登録できない' do
        @purchase_address.tel = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telが12桁以上では登録できない' do
        @purchase_address.tel = '0000000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'telに半角数字以外が含まれている場合は登録できない' do
        @purchase_address.tel = '000-0000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Tel is invalid')
      end
      it 'user_idが紐づいていないと登録できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていないと登録できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できない' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

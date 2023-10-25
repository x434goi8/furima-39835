require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: @user.id, item_id: @item.id)
    end

    context '購入できる場合' do
      it 'すべての値が存在すれば登録できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_name以外が存在すれば登録できる' do
        @purchase_shipping.building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では登録できない' do
        @purchase_shipping.postal_code = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは、「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
        @purchase_shipping.postal_code = '123456'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'prefecture_idが空では登録できない' do
        @purchase_shipping.prefecture_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'city_or_districtが空では登録できない' do
        @purchase_shipping.city_or_district = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City or district can't be blank")
      end

      it 'street_addressが空では登録できない' do
        @purchase_shipping.street_address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは10桁以上11桁以内の半角数値でないと登録できない' do
        @purchase_shipping.phone_number = '12345'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid. Include hyphen(-)")
      end
    end
  end
end

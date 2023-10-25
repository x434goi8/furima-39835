require 'rails_helper'

RSpec.describe ShippingDetail, type: :model do
  before do
    @shipping_detail = FactoryBot.build(:shipping_detail)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
      it 'purchase_idとpostal_code、prefecture_idとcity_or_district、street_address、building_name、phone_numberが存在すれば登録できる' do
        expect(@shipping_detail).to be_valid
      end
      it 'building_name以外が存在すれば登録できる' do
        @shipping_detail.building_name = ''
        expect(@shipping_detail).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では登録できない' do
        @shipping_detail.postal_code = ''
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは、「3桁ハイフン4桁」の半角文字列でなければ登録できない' do
        @shipping_detail.postal_code = '123456'
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが空では登録できない' do
        @shipping_detail.prefecture_id = nil
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'city_or_districtが空では登録できない' do
        @shipping_detail.city_or_district = ''
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include("City or district can't be blank")
      end

      it 'street_addressが空では登録できない' do
        @shipping_detail.street_address = ''
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include("Street address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @shipping_detail.phone_number = ''
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは10桁以上11桁以内の半角数値でないと登録できない' do
        @shipping_detail.phone_number = '12345'
        @shipping_detail.valid?
        expect(@shipping_detail.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end

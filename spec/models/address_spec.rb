require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end
  describe '商品購入機能' do
    context '購入できる場合' do
      it '全て正常であると購入できる' do
        expect(@address).to be_valid
      end
    end
    context '購入できない場合' do
      it '郵便番号が空では購入できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post Code can't be blank")
      end
      it '郵便番号ハイフンなしでは購入できない' do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post Code is invalid")
      end
      it '郵便番号が全角文字列では購入できない' do
        @address.post_code = '１２３-４５６７'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post Code is invalid")
      end
      it '市町区村が空では購入できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @address.phone_num = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone Num can't be blank")
      end
      it '電話番号ハイフン有りでは登録できない' do
        @address.phone_num = '090-1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone Num is invalid")
      end
      it '電話番号が全角数値では購入できない' do
        @address.phone_num = '０９０１２３４５６７８'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone Num is invalid")
      end
    end
  end
end

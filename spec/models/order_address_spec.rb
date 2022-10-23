require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, item_id:@item.id, user_id:@user.id)
    end

    context '内容に問題がない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ユーザーが紐付いていなければ購入できない'  do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'アイテムが紐付いていなければ購入できない'  do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    
      it '郵便番号が空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号ハイフンなしでは購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角文字列では購入できない' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されているときは購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町区村が空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_address.phone_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num can't be blank")
      end
      it '電話番号ハイフン有りでは登録できない' do
        @order_address.phone_num = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が全角数値では購入できない' do
        @order_address.phone_num = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が９桁以下では登録できない' do
        @order_address.phone_num = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it '電話番号が12桁以上では登録できない' do
        @order_address.phone_num = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone num is invalid")
      end
      it 'tokenがないと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end

  end
end
require 'rails_helper'

RSpec.describe BuyingAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buying_address = FactoryBot.build(:buying_address, user_id: @user.id, item_id: @item_id,)
    end
    describe '商品購入記録の保存' do

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
          expect(@buying_address).to be_valid
      end
      it 'buildding_nameは空でも保存できること' do
          @buying_address.building_name = ''
          expect(@buying_address).to be_valid
      end
    end

   context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @buying_address.post_code = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buying_address.post_code = '123-4567'
        @buying_address.valid?
         expect(@buying_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'cityを選択していないと保存できないこと' do
        @buying_address.city = '1'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_idが空だと保存できないこと' do
        @buying_address.address_id = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Address id can't be blank")
      end
      it 'numberが空だと保存できないこと' do
        @buying_address.number = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buying_address. phone_number = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角出なければ保存できないこと' do
        @buying_address.phone_number = '０9012345678'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以上では登録できない' do
        @buying_address.phone_number = '090123456789'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include('Phone number is too short (minimum is 6 characters)')
      end
      it 'Phone_numberが10桁以下では登録できない' do
        @buying_address.phone_number = '09012345678'
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include('Phone number is less than 10 characters')
      end
      it 'userが紐付いていないと保存できないこと' do
        @buying_address.user_id = nil
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("User can't be blank")
      end



   context '内容に問題ない場合' do
      it 'カード情報とtokenがあれば保存ができること' do
        expect(@buying_address).to be_valid
      end
   end

  context '内容に問題がある場合' do
      it 'カード情報が空では保存ができないこと' do
        @buying_address.number = ''
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Number-form can't be blank")
    end

      it 'tokenが空では登録できないこと' do
        @buying_address.token = nil
        @buying_address.valid?
        expect(@information.errors.full_messages).to include("Token can't be blank")
    end
      it 'item_idが紐付いていないと保存できないこと' do
        @buying_address.item_id = nil
        @buying_address.valid?
        expect(@buying_address.errors.full_messages).to include("Item can't be blank")
    end

  end
 end
end

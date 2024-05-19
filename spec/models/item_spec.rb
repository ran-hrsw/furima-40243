require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品する' do
    context '商品出品できる場合' do
      it 'すべての値が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'item_imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'category_idが空でが登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end

      it 'cost_idが空では登録できない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost is not a number')
      end

      it 'address_idが空では登録できない' do
        @item.address_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Address is not a number')
      end

      it 'transit_time_idが空では登録できない' do
        @item.transit_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Transit time is not a number')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '￥300未満では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '￥10,000以上では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '半角英数字以外では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end

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

      it 'imageが空では登録できない' do
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
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが空では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'cost_idが空では登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be other than 1')
      end

      it 'address_idが空では登録できない' do
        @item.address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Address must be other than 1')
      end

      it 'transit_time_idが空では登録できない' do
        @item.transit_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Transit time must be other than 1')
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '￥300未満では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '￥10,000以上では登録できない' do
        @item.price = 10_001
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000')
      end

      it '半角英数字以外では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end

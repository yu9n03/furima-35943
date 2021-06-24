require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'image、name、text、category_id、status_id、charge_rate、prefecture_id、until_send_id、priceが入力されていれば出品できる' do
        expect(@item).to be_valid
        end
      it 'priceが300であれば出品できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが9999999であれば出品できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが1では出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'charge_rate_idが1では出品できない' do
        @item.charge_rate_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge rate can't be blank")
      end
      it 'prefecture_idが1では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'until_send_idが1では出品できない' do
        @item.until_send_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Until send can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'priceが半角英数では出品できない' do
        @item.price = 'a1a1a1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters")
      end
      it 'priceが299では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'priceが10000000では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'userとimageとproduct_name、descriptionとcategory_idとstatus_idとshipping_charge_idとshipping_area_idとshipping_day_idとpriceが存在すれば登録できる。' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができないとき' do
      it 'userが登録されていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
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
      it 'item_textが空では登録できない' do
        @item.item_text = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが1では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipping_idが1では登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")
      end
      it 'pref_idが1では登録できない' do
        @item.pref_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Pref must be other than 1")
      end
      it 'cheduled_day_idが1では登録できない' do
        @item.scheduled_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled day must be other than 1")
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it 'item_priceが300以下では登録できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it 'item_priceが9999999以上では登録できない' do
        @item.item_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid")
      end
      it 'item_priceが半角文字以外では登録できない' do
        @item.item_price = 'あAアｱa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it 'item_priceが全角文字では登録できない' do
        @item.item_price = 'あア'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it 'item_priceが半角英語だけでは登録できない' do
        @item.item_price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
    end
  end
end
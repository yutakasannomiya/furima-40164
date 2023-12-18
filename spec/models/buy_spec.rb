require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe '購入情報の保存' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy = FactoryBot.build(:buy, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy.building = ''
        expect(@buy).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @buy.post_code = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy.post_code = '1234567'
        @buy.valid?
        expect(@buy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'pref_id、１を選択すると保存できないこと' do
        @buy.pref_id = 1
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Pref must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @buy.city = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy.address = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @buy.tel = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが12桁以上だとだと保存できないこと' do
        @buy.tel = '0901234123456'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tel is invalid, Half-width number")
      end

      it 'telが半角数字以外が混じっていると保存できないこと' do
        @buy.tel = 'aaa12341234'
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tel is invalid, Half-width number")
      end

      it 'user_idが空だと保存できないこと' do
        @buy.user_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @buy.item_id = ''
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end

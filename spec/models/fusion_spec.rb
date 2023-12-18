require 'rails_helper'

RSpec.describe Fusion, type: :model do
  describe '購入情報の保存' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @fusion = FactoryBot.build(:fusion,user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@fusion).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @fusion.building = ''
        expect(@fusion).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @fusion.token = nil
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @fusion.post_code = ''
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @fusion.post_code = '1234567'
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'pref_id、１を選択すると保存できないこと' do
        @fusion.pref_id = 1
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Pref must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @fusion.city = ''
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @fusion.address = ''
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @fusion.tel = ''
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが12桁以上だとだと保存できないこと' do
        @fusion.tel = '0901234123456'
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Tel is invalid, Half-width number")
      end

      it 'telが半角数字以外が混じっていると保存できないこと' do
        @fusion.tel = 'aaa12341234'
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Tel is invalid, Half-width number")
      end

      it 'user_idが空だと保存できないこと' do
        @fusion.user_id = ''
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @fusion.item_id = ''
        @fusion.valid?
        expect(@fusion.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end

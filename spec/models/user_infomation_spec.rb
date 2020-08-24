require 'rails_helper'

RSpec.describe UserInfomation, type: :model do
  before do
    @user_infomation = FactoryBot.build(:user_infomation)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it 'post_code,shipping_area_id,city,house_name,phone_numberが存在すれば購入できる' do
        expect(@user_infomation).to be_valid
      end
      it '郵便番号にハイフンがあれば購入できる' do
        @user_infomation.post_code = '573-0013'
        expect(@user_infomation).to be_valid
      end
      it '電話番号はハイフンが不要で、11桁以内だと購入できる' do
        @user_infomation.phone_number = '09042784708'
        expect(@user_infomation).to be_valid
      end
      it 'building_nameはからでも登録できる' do
        @user_infomation.building_name = nil
        expect(@user_infomation).to be_valid
      end
    end
    context '購入がうまくいかないとき' do
      it 'post_codeが空だと購入できない' do
        @user_infomation.post_code = nil
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeにハイフンがないと購入できない' do
        @user_infomation.post_code = '5730013'
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include('Post code is invalid')
      end
      it 'shipping_area_idが空だと購入できない' do
        @user_infomation.shipping_area_id = nil
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
      end
      it 'cityが空だと購入できない' do
        @user_infomation.city = nil
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include("City can't be blank")
      end
      it 'house_nameが空だと購入できない' do
        @user_infomation.house_name = nil
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include("House name can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @user_infomation.phone_number = nil
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @user_infomation.phone_number = '090427847088'
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空だと購入できない' do
        @user_infomation.token = nil
        @user_infomation.valid?
        expect(@user_infomation.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

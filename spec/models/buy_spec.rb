require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it 'post_code,shipping_area_id,city,house_name,phone_numberが存在すれば購入できる' do
        expect(@buy).to be_valid
      end
      it '郵便番号にハイフンがあれば購入できる' do
      end
      it '電話番号はハイフンが不要で、11桁いないだと購入できる' do
      end
    end
    context '購入がうまくいかないとき' do
      it 'post_codeが空だと購入できない' do
      end
      it 'post_codeにハイフンがないと購入できない' do
      end
      it 'shipping_area_idが空だと購入できない' do
      end
      it 'cityが空だと購入できない' do
      end
      it 'house_nameが空だと購入できない' do
      end
      it 'phone_numberが空だと購入できない' do
      end
      it 'phone_numberにハイフンがあると購入できない' do
      end
      it 'phone_numberが12桁以上だと購入できない' do
      end
    end
  end
end

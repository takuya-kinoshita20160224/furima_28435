require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it 'image,name,text,category,status,delivery_fee,
      shipping_area,shipping_date,priceが入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceの範囲が300〜9999999の間であれば出品できる' do
        @item.price = 301
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリー情報が空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態の情報が空だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it '配送料の負担についての情報が空だと出品できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
      end
      it '発送元の地域についての情報が空だと出品できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
      end
      it '発送までの日数についての情報が空だと出品できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank", 'Shipping date is not a number')
      end
      it '価格の情報が空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が300〜9999999の間でなければ出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end 

  describe '商品情報の入力' do
    context '商品情報の入力がうまくいくとき' do
      it '全ての値が入力されていると登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品情報の入力がうまくいかない時' do
      it 'item_nameが空だと登録できない' do
        @item.item_name = '' 
        @item.valid?                                   
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
    
      it 'imageが空だと登録できない' do
        @item.image = nil 
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_infoが空だと登録できない' do
        @item.item_info = ''  
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'categoryが0だと登録できない' do
        @item.category_id = 0 
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Category must be other than 0"
      end
      it 'sales_statusが0だと登録できない' do
        @item.sales_status_id = 0  
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Sales status must be other than 0"
      end
      it 'delivery_feeが0だと登録できない' do
        @item.delivery_fee_id = 0 
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Delivery fee must be other than 0"
      end
      it 'prefectureが0だと登録できない' do
        @item.prefecture_id = 0  
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Prefecture must be other than 0"
      end
      it 'delivery_dateが0だと登録できない' do
        @item.delivery_date_id = 0  
        @item.valid?                                   
        expect(@item.errors.full_messages).to include "Delivery date must be other than 0"
      end
      it 'priceが半角数字では無い時登録出来ない' do
        @item.price = 'あいうえおか'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが半角英数混合では登録出来ない' do
        @item.price = 'あいうえおか'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが全角文字では登録出来ない' do
        @item.price = 'ｱｲｳｴｵ'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが半角英語だけでは登録出来ない' do
        @item.price = 'ABCD'  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが¥299以下の時登録出来ない' do
        @item.price = 299  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが¥10000000以上の時登録出来ない' do
        @item.price = 10_000_000  
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
    end
  end
end
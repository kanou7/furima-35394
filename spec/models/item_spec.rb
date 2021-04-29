require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品の保存' do
    context "出品が保存できる場合" do
      it "name, price, text, category_id, status_id, deli_price_id, area_id, deli_day_id, imageが存在するとき保存できる" do
        expect(@item).to be_valid
      end
      it "category_id, status_id, deli_price_id, area_id, deli_day_idは1以外の時保存できる" do
        @item.category_id = 2
        @item.status_id = 2
        @item.deli_price_id = 2
        @item.area_id = 2
        @item.deli_day_id = 2
        expect(@item).to be_valid
      end
      it "販売価格は、¥300~¥9,999,999の間のみ保存できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
      it "販売価格は半角数字のみ保存できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context "出品が保存できない場合" do
      it "nameが空では登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end  
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end  
      it "textが空では登録できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Text can't be blank"
      end  
      it "category_idが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end  
      it "status_idが空では登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end  
      it "deli_price_idが空では登録できない" do
        @item.deli_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Deli price can't be blank"
      end  
      it "area_idが空では登録できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end  
      it "deli_day_idが空では登録できない" do
        @item.deli_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Deli day can't be blank"
      end  
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end  
      it "priceは半角数字出ないと保存できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end 
      it "priceは300より小さいと保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than 299"
      end
      it "priceは9999999より大きいと保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than 10000000"
      end 
      it "category_idは1以外でないと保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end 
      it "status_idは1以外でないと保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end 
      it "deli_price_idは1以外でないと保存できない" do
        @item.deli_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Deli price must be other than 1"
      end 
      it "area_idは1以外でないと保存できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end 
      it "deli_day_idは1以外でないと保存できない" do
        @item.deli_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Deli day must be other than 1"
      end 
    end
  end
end

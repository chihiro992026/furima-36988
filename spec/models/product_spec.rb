require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品情報登録機能' do 
    context '商品情報を入力できる場合' do
    it 'image, product_name, description, category_id, status_id, shipping_cost_id, shipping_day_id, user, price, prefecture_idが存在すれば登録できること' do
     expect(@product).to be_valid
    end
    end
  context '商品情報を入力できない場合' do
    it 'imageが空では登録できない' do
      @product.image = nil 
      # binding.pry 
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it 'product_nameが空では登録できない' do
      @product.product_name = ''  
      @product.valid?
      expect(@product.errors.full_messages).to include("Product name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @product.description = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryが--では登録できない' do
      @product.category_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")   
    end
    it 'statusが--では登録できない' do
      @product.status_id = 1 
      @product.valid?
      expect(@product.errors.full_messages).to include("Status must be other than 1")
    end
    it 'prefectureが--では場合は登録できない' do
      @product.prefecture_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'shipping_days_id場合は登録できない'do
      @product.shipping_days_id = 1
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping days must be other than 1")
    end
    it 'priceが9,999,999円以上の場合は登録できない'do
      @product.price = 10,000,000
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300円以下の場合は登録できない'do
      @product.price = 299
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
    end 
    it 'priceが空の場合では登録できない'do
       @product.price =''
       @product.valid?
       expect(@product.errors.full_messages).to include("Price can't be blank")
      end 
    it 'Priceに半角数値以外の文字（平仮名・漢字・英字・記号）が含まれていると保存できない'do
       @product.price = 'ひらがな漢字abc@'
       @product.valid?
       expect(@product.errors.full_messages).to include('Price is not a number')
      end
    
    it 'userが紐づいていないと登録できない' do
       @product.user = nil
       @product.valid?
       expect(@product.errors.full_messages).to include('User must exist')
     end 
  end
  end
end

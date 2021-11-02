# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| nickname           | string | null: false              | 
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthday           | date   | null: false              |　 
### Association

- has_many :records
- has_many :products

## destinations テーブル

 Column              | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| post_code          | string | null: false                    |
| prefecture_id      | integer| null: false                    |
| city               | string | null: false                    |
| address            | string | null: false                    |
| building_name      | string |                                |　 
| phone_number       | string | null: false                    | 
| record             |references| null: false, foreign_key: true |  
### Association

- belongs_to :record

## products テーブル

Column               | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| price              | integer| null: false,                   |
| description        | text   | null: false,                   |
| status_id          | integer| null: false,                   | 
| shipping_cost_id   | integer| null: false,                   |
| shipping_days_id   | integer| null: false,                   |
| prefecture_id      | integer| null: false,                   |
| category_id        | integer| null: false,  foreign_key: true|　
| user               |references| null: false,  foreign_key: true|　


### Association

- belongs_to :user
- has_one : record

## records テーブル
Column               | Type   | Options                        |
| ------------------ | ------ | -------------------------------|
| user               | references| null: false, foreign_key: true|
| product            | references| null: false, foreign_key: true|

### Association

- has_one : destination
- belong_to : user
- belong_to : product

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do 
   context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''  
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = '' 
      @user.valid?
      expect(user.errors[:first_name]).to include("First_name can't be blank")
    end
    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(user.errors[:last_name]).to include("Last_name can't be blank")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(user.errors[:first_name_kana]).to include("First_name_kana can't be blank")
    end
    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(user.errors[:last_name_kana]).to include("Last_name_kana can't be blank")
    end
    it "birthdayがない場合は登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(user.errors[:birthday]).to include("Birthday can't be blank")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it " 重複したemailが存在する場合は登録できないこと " do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it " passwordが6文字以下であれば登録できないこと " do
      @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')   
    end
  end 
    context '新規登録できる場合' do
    it " passwordが7文字以上であれば登録できること " do
    user = build(:user, password: "1234567", password_confirmation: "1234567")
    expect(user).to be_valid
    end
    it " passwordが7文字以上であれば登録できること " do
    user = build(:user, password: "1234567", password_confirmation: "1234567")
    expect(user).to be_valid
    end 
    it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できること" do
    user = build(:user)
    expect(user).to be_valid
    end
    end
  end
end　


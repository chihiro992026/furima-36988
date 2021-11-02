require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do 
    context '新規登録できる場合' do
    it 'nicknameとemail、passwordとpassword_confirmation、first_name、family_name、first_name_kana、family_name_kana、birthdayが存在すれば登録できること'do
     expect(@user).to be_valid
    end

    end
   context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'a2345'
      @user.password_confirmation = 'a2345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')   
    end
    it 'first_nameがない場合は登録できない' do
      @user.first_name = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_nameがない場合は登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_name_kanaがない場合は登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaがない場合は登録できない'do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'birthdayがない場合は登録できない'do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'  
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

  end  
  end
end

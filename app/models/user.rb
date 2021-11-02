class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々ー]/}
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
  validates :family_name_kana
  validates :first_name_kana 
  end
  validates :birthday, presence: true
end

# require 'rails_helper'

# RSpec.describe User, type: :model do
  # before do
    # @user = FactoryBot.build(:user)
  # end

  # describe 'ユーザー新規登録' do    
    # it 'nicknameが空では登録できない' do
      # user = FactoryBot.build(:user)  # Userのインスタンス生成
      # user.nickname = ''  # nicknameの値を空にする
      # user.valid?
      # expect(user.errors.full_messages).to include "Nickname can't be blank"
    # end
    # it 'emailが空では登録できない' do
      # user = FactoryBot.build(:user)  # Userのインスタンス生成
      # user.email = ''  # emailの値を空にする
      # user.valid?
      # expect(user.errors.full_messages).to include "Email can't be blank"
    # end
  # end
# end
require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'test_com.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '000000' # 数字のみのテスト
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa' # 英字のみのテスト
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードは、確認用を含めて2回入力すること' do
      @user.password = '0000ta'
      @user.password_confirmation = '0000tas'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'ユーザー本名は、名字が必須であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'ユーザー本名は、名前が必須であること' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'ユーザー本名は、名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
    end
    it 'ユーザー本名は、名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
    end
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First kana can't be blank")
    end
    it 'ユーザー本名のフリガナは、名字は全角（カタカナ）での入力が必須であること' do
      @user.last_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last kana is invalid. Input full-width katakana characters.')
    end
    it 'ユーザー本名のフリガナは、名前は全角（カタカナ）での入力が必須であること' do
      @user.first_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('First kana is invalid. Input full-width katakana characters.')
    end
    it '生年月日が必須であること' do
      @user.date = '1944-10-00'
      @user.valid?
      expect(@user.errors.full_messages).to include("Date can't be blank")
    end
  end
end

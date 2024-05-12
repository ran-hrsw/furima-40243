require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての値が存在すれば登録できる' do
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

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合での入力が必須です')
      end

      it '数字のみでは登録できない' do
        @user.password = '1234567890'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合での入力が必須です')
      end

      it '全角だと登録できない' do
        @user.password = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合での入力が必須です')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '姓(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name = 'rarara'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it '名(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'rarara'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it '姓のカナ(全角)は、全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = 'rarara'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana は全角（カタカナ）で入力してください')
      end

      it '名のカナ(全角)は、全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'rarara'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角（カタカナ）で入力してください')
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      # ・英字のみでは登録できないこと
      #  @user.password = 'abcdef'
      #  @user.valid?
      #  expect(@user.errors.full_messages).to include('')

      # ・数字のみでは登録できないこと
      # ・全角だと登録できないこと

      # ・姓(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない。
      # ・名(全角)は、全角（漢字・ひらがな・カタカナ）でなければ登録できない
      # ・姓のカナ(全角)は、全角（カタカナ）でなければ登録できない
      # ・名のカナ(全角)は、全角（カタカナ）でなければ登録できない
    end
  end
end

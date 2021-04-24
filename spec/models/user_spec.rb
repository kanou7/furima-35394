require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name、family_name_kanaとfirst_name_kana、birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字であれば登録できる' do
        @user.password = '11111a'
        @user.password_confirmation = '11111a'
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameが全角文字なら登録できる' do
        @user.family_name = "本田"
        @user.first_name = "圭佑"
        expect(@user).to be_valid
      end
      it 'family_name_kanaとfirst_name_kanaがカナ文字なら登録できる' do
        @user.family_name_kana = "ホンダ"
        @user.first_name_kana = "ケイスケ"
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含まないと登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは半角英数字混同出ないと登録できない' do
        @user.password = '111111' 
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
      end
      it 'family_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = "111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name 全角文字を使用してください"
      end
      it 'first_nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = "222"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it 'family_name_kanaは、全角（カタカナ）でないと登録できない' do
        @user.family_name_kana = "ほんだ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana カナ文字を使用してください"
      end
      it 'first_name_kanaは、全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = "けいすけ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana カナ文字を使用してください"
      end

    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it 'nickname、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthday全てがあれば登録できる' do
      end
      it 'passwordとpassword_confirmationは6文字以上の半角英数混合の入力であれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it '重複したemailが存在する場合登録できない' do
      end
      it 'パスワードに@を含まないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordが半角英数混合でなければ登録できない' do
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
    end
  end

  describe 'ユーザー新規登録/本人確認情報' do
    context '新規登録できないとき' do
      it 'last_nameが空では登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_name_kanaが空では登録できない' do
      end
      it 'first_name_kanaが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      end
      it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
      end
      it 'first_nameが全角（カタカナ）でなければ登録できない' do
      end
    end
  end
end
require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができないとき' do
    it 'ニックネームが空だと登録できない' do
      @user.nickname = ""
      @user.valid?
      binding.pry
    end
  
    it 'メールアドレスが空だと登録できない' do
    end

    it '同じメールアドレスは登録できない' do
    end

    it 'メールアドレスに＠を含まないものは登録できない' do
    end

    it 'パスワードが空だと登録できない' do
    end

    it 'パスワードが6文字以上ではないと登録できない' do
    end

    it 'パスワードは英数字混合である事' do
    end

    it 'パスワードは確認用を含めて2回入力する事' do
    end
  end

  context '本人情報確認' do
    it 'ユーザー本名が苗字と名前それぞれ空だと登録できない' do
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力する事' do
    end

    it 'ユーザー本名のフリガナが、苗字と名前でそれぞれ空だと登録できない' do
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）で入力する事' do
    end

    it '生年月日が空だと入力できない' do
    end
  end

end

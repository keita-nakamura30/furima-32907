require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録出来ない' do
      @user.password = ''  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'birth_dayが空では登録出来ない' do
      @user.birth_day = ''  # birth_dayの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it 'name_lastname_kanaが空では登録出来ない' do
      @user.name_lastname_kana = ''  # name_lastname_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname kana Last name Full-width characters"
    end
    it 'name_firstname_kanaが空では登録出来ない' do
  
      @user.name_firstname_kana = ''  # name_firstname_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname kana First name Full-width characters"
    end
    it 'name_lastnameが空では登録出来ない' do
      @user.name_lastname = ''  # name_lastnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname Last name can't be blank"
    end
    it 'name_firstnameが空では登録出来ない' do
      @user.name_firstname = ''  # name_firstnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname First name can't be blank"
  end
end
end
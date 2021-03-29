require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての値が入力されていると登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかない時' do
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
    it 'passwordが半角英数混合では無い時登録出来ない' do
      @user.password = 'あいうえおか'  # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Password Include both letters and numbers"
    end
    it 'name_lastname_kanaが全角カタカナでは無い時は登録できない' do
      @user.name_lastname_kana = 'ｱｲｳｴｵ'  # ここの記述はメンターさんに聞く
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname kana Full width katakana characters"
    end

    it 'name_firstname_kanaが全角カタカナでは無い時は登録できない' do
      @user.name_firstname_kana = 'ｱｲｳabc'  # ここの記述はメンターさんに聞く
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname kana Full width katakana characters"
    end

    it 'name_lastnameが全角漢字ひらがなカタカナでは無い時は登録できない' do
      @user.name_lastname = 'ｱｲｳｴｵ'  # ここの記述はメンターさんに聞く
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname Full width characters"
    end

    it 'name_firstnameが全角漢字ひらがなカタカナでは無い時は登録できない' do
      @user.name_firstname = 'ｱｲｳｴｵ'  # ここの記述はメンターさんに聞く
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname Full width characters"
    end


    it 'birth_dayが空では登録出来ない' do
      @user.birth_day = ''  # birth_dayの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it 'name_lastname_kanaが空では登録出来ない' do
      @user.name_lastname_kana = ''  # name_lastname_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname kana can't be blank"
    end
    it 'name_firstname_kanaが空では登録出来ない' do
  
      @user.name_firstname_kana = ''  # name_firstname_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname kana can't be blank"
    end
    it 'name_lastnameが空では登録出来ない' do
      @user.name_lastname = ''  # name_lastnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname can't be blank"
    end
    it 'name_firstnameが空では登録出来ない' do
      @user.name_firstname = ''  # name_firstnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname can't be blank"
   end
  end
 end
end
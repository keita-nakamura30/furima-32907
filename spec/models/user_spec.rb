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
      @user.nickname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''  
      @user.valid?
      
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
      it 'emailに@が無いと登録できない' do
        @user.email = '！＃'  
        @user.valid?
        
        expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save  
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email 
      another_user.valid?
      
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空では登録出来ない' do
      @user.password = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが６文字以上でないと登録できないこと' do
      @user.password = '12345' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが半角英数混合では無い時登録出来ない' do
      @user.password = 'あいうえおか'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Password Include both letters and numbers"
    end
    it 'passwordが英語のみでは登録できないこと' do
      @user.password = 'ABCD'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Password Include both letters and numbers"
    end
    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '1234'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Password Include both letters and numbers"
    end
    it 'name_lastname_kanaが全角カタカナでは無い時は登録できない' do
      @user.name_lastname_kana = 'ｱｲｳｴｵ'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname kana Full width katakana characters"
    end

    it 'name_firstname_kanaが全角カタカナでは無い時は登録できない' do
      @user.name_firstname_kana = 'ｱｲｳabc'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname kana Full width katakana characters"
    end

    it 'name_lastnameが全角漢字ひらがなカタカナでは無い時は登録できない' do
      @user.name_lastname = 'ｱｲｳｴｵ'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname Full width characters"
    end

    it 'name_firstnameが全角漢字ひらがなカタカナでは無い時は登録できない' do
      @user.name_firstname = 'ｱｲｳｴｵ'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname Full width characters"
    end


    it 'birth_dayが空では登録出来ない' do
      @user.birth_day = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
    it 'name_lastname_kanaが空では登録出来ない' do
      @user.name_lastname_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname kana can't be blank"
    end
    it 'name_firstname_kanaが空では登録出来ない' do
  
      @user.name_firstname_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname kana can't be blank"
    end
    it 'name_lastnameが空では登録出来ない' do
      @user.name_lastname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name lastname can't be blank"
    end
    it 'name_firstnameが空では登録出来ない' do
      @user.name_firstname = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name firstname can't be blank"
   end
  end
 end
end
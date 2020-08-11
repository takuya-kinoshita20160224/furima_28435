require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", 'Email is invalid')
      end
      it 'emailが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含む必要があること' do
        expect(@user.email).to include('@')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'kino1'
        @user.password_confirmation = 'kino1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = '１２３KGT'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'family_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'kinoshita'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.last_name = 'takuya'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'family_name_phoneticが空だと登録できない' do
        @user.family_name_phonetic = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name phonetic can't be blank")
      end
      it 'last_name_phoneticが空だと登録できない' do
        @user.last_name_phonetic = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic can't be blank")
      end
      it 'family_name_phoneticは全角（カタカナ）でないと登録できない' do
        @user.family_name_phonetic = 'きのした'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name phonetic is invalid')
      end
      it 'last_name_phoneticは全角（カタカナ）でないと登録できない' do
        @user.last_name_phonetic = 'たくや'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name phonetic is invalid')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,family_name,last_name,
      family_name_phonetic,last_name_phonetic,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる' do
        @user.password = 'kino11'
        @user.password_confirmation = 'kino11'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = 'kino11'
        @user.password_confirmation = 'kino11'
        expect(@user).to be_valid
      end
      it 'family_name,last_nameが全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.family_name = '木下'
        @user.last_name = '拓也'
        expect(@user).to be_valid
      end
      it 'family_name_phonetic,last_name_phoneticが全角（カタカナ）であれば登録できる' do
        @user.family_name_phonetic = 'キノシタ'
        @user.last_name_phonetic = 'タクヤ'
        expect(@user).to be_valid
      end
    end
  end
end

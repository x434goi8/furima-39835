require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、last_nameとfirst_name、last_name_kanaとfirst_name_kana、passwordとpassword_confirmation、date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors[:nickname]).to include("can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = 'different_password'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors[:last_name]).to include("can't be blank")
      end

      it 'last_nameが全角/カナ/漢字以外では登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors[:last_name]).to include('is invalid')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors[:first_name]).to include("can't be blank")
      end

      it 'first_nameが全角/カナ/漢字以外では登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors[:first_name]).to include('is invalid')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include("can't be blank")
      end

      it 'last_name_kanaが全角/カナ/漢字以外では登録できない' do
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('is invalid')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank")
      end

      it 'first_name_kanaが全角/カナ/漢字以外では登録できない' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('is invalid')
      end

      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors[:date_of_birth]).to include("can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'invalid_email'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors[:password]).to include('is too long (maximum is 128 characters)')
      end

      it 'passwordが英字のみでは登録できない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '123あabc'
        @user.password_confirmation = '123あabc'
        @user.valid?
        expect(@user.errors[:password]).to include('is invalid')
      end
    end
  end
end

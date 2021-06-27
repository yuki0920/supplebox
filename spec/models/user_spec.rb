# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product) }
  let(:other_product) { FactoryBot.create(:product) }

  describe 'ユーザー登録できる場合' do
    it '新規登録できること' do
      expect(user).to be_valid
    end
  end

  describe 'ユーザー名を検証する場合' do
    it 'ユーザー名が無いと無効な状態であること' do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'ユーザー名が50文字なら有効な状態であること' do
      user.name = 'a' * 50
      user.valid?
      expect(user).to be_valid
    end

    it 'ユーザー名が50文字超なら無効な状態であること' do
      user.name = 'a' * 51
      user.valid?
      expect(user.errors[:name]).to include('は50文字以内で入力してください')
    end
  end

  describe 'ニックネームを検証する場合' do
    it 'ニックネームが50文字なら有効な状態であること' do
      user.nickname = 'a' * 50
      user.valid?
      expect(user).to be_valid
    end

    it 'ニックネームが50文字超なら無効な状態であること' do
      user.nickname = 'a' * 51
      user.valid?
      expect(user.errors[:nickname]).to include('は50文字以内で入力してください')
    end
  end

  describe 'メールアドレスを検証する場合' do
    it 'メールアドレスが無いと無効な状態であること' do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it '重複したメールアドレスなら無効な状態であること' do
      FactoryBot.create(:user, email: 'tester@supplebox.jp')
      user.email = 'tester@supplebox.jp'
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end

    it 'メールアドレスに@が含まれていないなら無効な状態であること' do
      user.email = 'supplebox.jp'
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end

    it 'メールアドレスが保存される前に小文字に変換されること' do
      user.email = 'TESTADD@supplebox.jp'
      user.save
      expect(user.email).to eq 'testadd@supplebox.jp'
    end
  end

  describe 'パスワードを検証する場合' do
    it 'パスワードと確認用パスワードが一致していないと無効な状態であること' do
      user.password = 'password'
      user.password_confirmation = 'invalid_password'
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とパスワードの入力が一致しません')
    end

    it 'パスワードが6文字未満なら無効な状態であること' do
      user.password = user.password_confirmation = 'a' * 5
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end

  describe '自己紹介を検証する場合' do
    it '100文字超だと無効な状態であること' do
      user.comment = 'a' * 101
      user.valid?
      expect(user.errors[:comment]).to include('は100文字以内で入力してください')
    end
  end

  describe 'like/unlike/like?メソッドを検証する場合' do
    context 'likeしていない状態の場合' do
      it '無効な状態であること' do
        expect(user.like?(product)).to eq false
      end
    end

    context 'likeした場合' do
      before do
        user.like!(product)
      end

      it 'like状態であること' do
        expect(user.like?(product)).to eq true
      end

      it 'likeしていないアイテムが無効な状態であること' do
        expect(user.like?(other_product)).to eq false
        expect(other_user.like?(other_product)).to eq false
        expect(other_user.like?(product)).to eq false
      end

      it 'unlikeすると無効な状態であること' do
        user.unlike!(product)
        expect(user.like?(product)).to eq false
      end
    end
  end
end

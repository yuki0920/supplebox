# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'お問い合わせが有効である時' do
    it '新規登録できること' do
      contact = FactoryBot.build(:contact)
      contact.valid?
      expect(contact).to be_valid
    end
  end

  describe 'お名前を検証する場合' do
    it 'お名前が無いと新規登録できないこと' do
      user = FactoryBot.build(:contact, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'お名前が50文字なら有効な状態であること' do
      user = FactoryBot.build(:contact, name: 'a' * 50)
      user.valid?
      expect(user).to be_valid
    end

    it 'お名前が50文字超なら無効な状態であること' do
      user = FactoryBot.build(:contact, name: 'a' * 51)
      user.valid?
      expect(user.errors[:name]).to include('は50文字以内で入力してください')
    end
  end

  describe 'メールアドレスを検証する場合' do
    it 'メールアドレスが無いと新規登録できないこと' do
      user = FactoryBot.build(:contact, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'メールアドレスに@が含まれていないなら無効な状態であること' do
      user = FactoryBot.build(:contact, email: 'supplebox.tokyo')
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end

    it 'メールアドレスが保存される前に小文字に変換されること' do
      user = FactoryBot.build(:contact, email: 'TESTADD@supplebox.tokyo')
      user.save
      expect(user.email).to eq 'testadd@supplebox.tokyo'
    end
  end
end

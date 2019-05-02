require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product) }
  let(:other_product) { FactoryBot.create(:product) }

  describe  'ユーザー登録できる場合' do
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

    it 'ユーザー名が50文字超なら無効な状態であること' do
      user.name = 'a' * 51
      user.valid?
      expect(user.errors[:name]).to include('は50文字以内で入力してください')
    end
  end
  
  describe 'ニックネームを検証する場合' do
    it 'ニックネームが無いと無効な状態であること' do
      user.nickname = nil
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
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
  
  describe 'follow/unfollow/following?メソッドを検証する場合' do
    context 'followしていない状態の場合' do
      it '無効な状態であること' do
        expect(user.following?(other_user)).to eq false
      end
    end
    
    context 'followした場合' do
      before do
        user.follow(other_user)
      end
         
      it 'follow状態になること' do
        expect(other_user.followers).to include user
        expect(user.following?(other_user)).to eq true
      end
  
      it 'unfollowすると無効な状態であること' do
        user.unfollow(other_user)
        expect(user.following?(other_user)).to eq false
      end
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
        user.like(product)
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
        user.unlike(product)
        expect(user.like?(product)).to eq false
      end
    end
  end
end

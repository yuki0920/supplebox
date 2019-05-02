require 'rails_helper'

RSpec.describe User, type: :model do

  describe  'ユーザー登録できる場合' do
    
    it '新規登録できること' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end
  
  describe 'ユーザー名を検証する場合' do

    it 'ユーザー名が無いと新規登録できないこと' do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'ユーザー名が50文字超なら無効な状態であること' do
      user = FactoryBot.build(:user, name: 'a' * 51 )
      user.valid?
      expect(user.errors[:name]).to include('は50文字以内で入力してください')
    end

  end
  
  describe 'ニックネームを検証する場合' do
    it 'ニックネームが無いと新規登録できないこと' do
      user = FactoryBot.build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include('を入力してください')
    end
  
    it 'ニックネームが50文字超なら無効な状態であること' do
      user = FactoryBot.build(:user, nickname: 'a' * 51 )
      user.valid?
      expect(user.errors[:nickname]).to include('は50文字以内で入力してください')
    end
  end

  describe 'メールアドレスを検証する場合' do
    it 'メールアドレスが無いと新規登録できないこと' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
    
    it '重複したメールアドレスなら無効な状態であること' do
      FactoryBot.create(:user, email: 'tester@supplebox.jp')
      user = FactoryBot.build(:user, email: 'tester@supplebox.jp')
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end
    
    it 'メールアドレスに@が含まれていないなら無効な状態であること' do
      user = FactoryBot.build(:user, email: 'supplebox.jp' )
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end
    
    it 'メールアドレスが保存される前に小文字に変換されること' do
      user = FactoryBot.build(:user, email: 'TESTADD@supplebox.jp')
      user.save
      expect(user.email).to eq 'testadd@supplebox.jp'
    end
    
  end
  
  describe 'follow/unfollow/following?メソッドを検証する場合' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }
    
    it 'followしていないとfollow状態にならないこと' do
      expect(user.following?(other_user)).to eq false
    end

    it 'followしているとfollow状態になること' do
      user.follow(other_user)
      expect(other_user.followers).to include user
      expect(user.following?(other_user)).to eq true
    end

    it 'followしてunfollowするとfollow状態にならないこと' do
      user.follow(other_user)
      user.unfollow(other_user)
      expect(user.following?(other_user)).to eq false
    end
    
  end
  
  describe 'like/unlike/like?メソッドを検証する場合' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:user) }
    let(:product) { FactoryBot.create(:product) }
    let(:other_product) { FactoryBot.create(:product) }
    
    context 'likeしていない状態の場合' do
      it '有効でないこと' do
        expect(user.like?(product)).to eq false
      end
    end
    
    context 'likeしている状態の場合' do
      before do
        user.like(product)
      end
      
      it 'likeしたアイテムが有効であること' do
        expect(user.like?(product)).to eq true
      end
      
      it 'likeしていないアイテムが有効でないこと' do
        expect(user.like?(other_product)).to eq false
        expect(other_user.like?(other_product)).to eq false
        expect(other_user.like?(product)).to eq false
      end
      
      it 'unlikeするとアイテムが有効でないこと' do
        user.unlike(product)
        expect(user.like?(product)).to eq false
      end
      
    end

  end
  
end

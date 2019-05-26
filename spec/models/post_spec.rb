require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { FactoryBot.create(:post) }
  let(:other_post) { FactoryBot.create(:post) }  
  
  describe '口コミ投稿が有効な場合' do
    it '口コミ投稿ができること' do
      expect(post).to be_valid
    end
  end

  describe '口コミタイトルを検証する場合' do
    it 'タイトルがないと無効な状態であること' do
     post.title = nil
     post.valid?
     expect(post.errors[:title]).to include('を入力してください')
    end
    
    it 'タイトルが50文字超だと無効な状態であること' do
      post.title = "a" * 51
      post.valid?
     expect(post.errors[:title]).to include('は50文字以内で入力してください')
    end
  end
  
  describe '口コミ評価を検証する場合' do
    
    it '口コミ評価がないと無効な状態であること' do
      post.rate = nil
      post.valid?
      expect(post.errors[:rate]).to include('を入力してください')
    end
    
    # it '口コミ評価が整数でないと無効な状態であること' do
    #   post.rate = '1.5'
    #   post.valid?
    #   expect(post.errors[:rate]).to include('は整数で入力してください')
    # end
    
    it '口コミ評価が1未満だと無効な状態であること' do
      post.rate = -1
      post.valid?
      expect(post.errors[:rate]).to include('は1以上の値にしてください')
    end
    
    it '口コミ評価が1.0だと有効な状態であること' do
      post.rate = 1.0
      post.valid?
      expect(post).to be_valid
    end

    it '口コミ評価が5.0だと有効な状態であること' do
      post.rate = 5.0
      post.valid?
      expect(post).to be_valid
    end
    
    it '口コミ評価が5超だと無効な状態であること' do
      post.rate = 6
      post.valid?
      expect(post.errors[:rate]).to include('は5以下の値にしてください')
    end
  end
  
  describe '口コミ内容を検証する場合' do
    # it '口コミ内容がないと無効な状態であること' do
    #   post.content = nil
    #   post.valid?
    #   expect(post.errors[:content]).to include('を入力してください')
    # end
    
    it '口コミ内容が300文字だと有効な状態であること' do
      post.content = "a" * 300
      post.valid?
     expect(post).to be_valid
    end

    it '口コミ内容が300文字超だと無効な状態であること' do
      post.content = "a" * 301
      post.valid?
     expect(post.errors[:content]).to include('は300文字以内で入力してください')
    end
    
  end
  
  describe 'ユーザーを検証する場合' do
    it '1つのアイテムに対して口コミが重複すると無効な状態であること' do
      other_post.product_id = post.product_id
      other_post.user_id = post.user_id
      other_post.valid?
      expect(other_post.errors[:user_id]).to include('はすでに存在します')
    end
  end

end

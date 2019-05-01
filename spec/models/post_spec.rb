require 'rails_helper'

RSpec.describe Post, type: :model do
    before do
      @user = User.create(
        name: 'Test',
        nickname: 'テスト',
        email: 'tester@supplebox.jp',
        password: 'tester',            
        )
      
      @product = Product.create(
        title: 'テストアイテム',
        url: 'testurl.jp',
        image_url: 'testimageurl',
        asin: 'TEST01'
        )
    end
  
  it '口コミ投稿できること' do
    post = @user.posts.build(
      title: 'テスト',
      rate: '3',
      content: 'テスト投稿',
      product: @product
      )
    expect(post).to be_valid
  end
    
  it 'タイトルがないと無効な状態であること' do
   post = Post.new(title: nil)
   post.valid?
   expect(post.errors[:title]).to include('を入力してください')
  end

  it '口コミ評価がないと無効な状態であること' do
   post = Post.new(rate: nil)
   post.valid?
   expect(post.errors[:rate]).to include('を入力してください')
  end
  

  it '口コミ内容がないと無効な状態であること' do
   post = Post.new(content: nil)
   post.valid?
   expect(post.errors[:content]).to include('を入力してください')
  end
  
end

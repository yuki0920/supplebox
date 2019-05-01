require 'rails_helper'

RSpec.describe Post, type: :model do
  it '口コミ投稿できること' do
    user = User.create(
      name: 'Test',
      nickname: 'テスト',
      email: 'tester@supplebox.jp',
      password: 'tester',            
      )
    
    product = Product.create(
      title: 'テストアイテム',
      url: 'testurl.jp',
      image_url: 'testimageurl',
      asin: 'TEST01'
      )

    post = user.posts.build(
      title: 'テスト',
      rate: '3',
      content: 'テスト投稿',
      product: product
      )
    expect(post).to be_valid
    
  end
end

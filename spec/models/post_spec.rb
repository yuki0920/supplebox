require 'rails_helper'

RSpec.describe Post, type: :model do

  it '口コミ投稿できること' do
    post = FactoryBot.create(:post)
    expect(post).to be_valid
  end
    
  it 'タイトルがないと無効な状態であること' do
   post = FactoryBot.build(:post, title: nil)
   post.valid?
   expect(post.errors[:title]).to include('を入力してください')
  end

  it '口コミ評価がないと無効な状態であること' do
   post = FactoryBot.build(:post, rate: nil)
   post.valid?
   expect(post.errors[:rate]).to include('を入力してください')
  end
  

  it '口コミ内容がないと無効な状態であること' do
   post = FactoryBot.build(:post, content: nil)
   post.valid?
   expect(post.errors[:content]).to include('を入力してください')
  end
  
  it '口コミ評価が整数でないと無効な状態であること' do
    post = FactoryBot.build(:post, rate: '1.5')
    post.valid?
    expect(post.errors[:rate]).to include('は整数で入力してください')
  end
  
  it '口コミ評価が1未満だと無効な状態であること' do
    post = FactoryBot.build(:post, rate: '-1')
    post.valid?
    expect(post.errors[:rate]).to include('は1以上の値にしてください')
  end
  
  it '口コミ評価が5超だと無効な状態であること' do
    post = FactoryBot.build(:post, rate: '6')
    post.valid?
    expect(post.errors[:rate]).to include('は5以下の値にしてください')
  end

end

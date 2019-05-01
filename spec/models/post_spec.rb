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

end

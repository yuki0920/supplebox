require 'rails_helper'

describe '口コミ投稿機能', type: :system do
  it '口コミ投稿できること' do
    user = FactoryBot.create(:user)
    sign_in_as user
    product = FactoryBot.create(:product)
    visit product_path(product)
    expect{
      fill_in 'タイトル', with: 'テストタイトル'
      fill_in '口コミ内容', with: 'テストコンテント'
      click_on '投稿する'
    }.to change{ Post.count }.by(+1)
    expect(page).to have_content('口コミを投稿しました')
  end
  
  it '口コミを削除できること' do
    user = FactoryBot.create(:user)
    sign_in_as user
    product = FactoryBot.create(:product)
    visit product_path(product)
    fill_in 'タイトル', with: 'テストタイトル'
    fill_in '口コミ内容', with: 'テストコンテント'
    click_on '投稿する'
    visit user_path(user)
    expect{click_on '口コミを削除'}.to change{ Post.count}. by(-1)
    expect(page).to have_content '口コミを削除しました'
  end

  it '口コミを編集できること' do
    user = FactoryBot.create(:user)
    sign_in_as user
    product = FactoryBot.create(:product)
    visit product_path(product)
    fill_in 'タイトル', with: 'テストタイトル'
    fill_in '口コミ内容', with: 'テストコンテント'
    click_on '投稿する'
    visit user_path(user)
    click_on '口コミを編集'
    fill_in 'タイトル', with: 'アップデートタイトル'
    click_on '投稿する'
    expect(page).to have_content '口コミを更新しました'
    expect(page).to have_content 'アップデートタイトル'
  end
  
  
end
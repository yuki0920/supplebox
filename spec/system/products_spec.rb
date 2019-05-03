require 'rails_helper'

describe 'アイテム登録機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  
  it 'アイテムを検索できること' do
    sign_in_as user
    visit new_product_path
    fill_in 'keyword', with: 'プロテイン'
    click_on '商品を検索'
    expect(page).to have_content 'プロテイン'
  end

  it '登録したアイテム詳細画面を確認できること' do
    user = FactoryBot.create(:user)
    sign_in_as user
    product = FactoryBot.create(:product)
    visit products_path
    click_link product.title
    expect(page).to have_content('Amazonで詳しく見る')
  end

end
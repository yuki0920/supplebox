require 'rails_helper'

describe 'アイテム登録機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }
  let!(:product) { FactoryBot.create(:product) }
  
  # it 'アイテムを検索できること' do
  #   sign_in_as user
  #   visit new_product_path
  #   fill_in 'keyword', with: 'プロテイン'
  #   click_on '商品を検索'
  #   expect(page).to have_content 'プロテイン'
  # end

  it 'ログイン状態に関わらず登録したアイテム詳細画面を確認できること' do
    visit products_path
    click_link product.title
    expect(page).to have_content('Amazonで詳しく見る')
  end
  
  it '管理者は商品を削除できること' do
    sign_in_as admin_user
    visit products_path
    expect{click_on '商品削除'}.to change{ Product.count}.by(-1)
    expect(page).to have_content '商品を削除しました'
  end
  
  it '一般ユーザーは商品を削除できないこと' do
    sign_in_as user
    visit products_path
    expect(page).to_not have_content '商品削除'
  end

end
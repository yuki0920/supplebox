require 'rails_helper'

describe 'アイテム登録機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }
  let!(:product) { FactoryBot.create(:product) }
  
  # describe '検索機能' do
    # it 'アイテムを検索できること' do
    #   sign_in_as user
    #   visit new_product_path
    #   fill_in 'keyword', with: 'プロテイン'
    #   click_on '商品を検索'
    #   expect(page).to have_content 'プロテイン'
    # end
  # end
  
  describe '詳細表示機能' do
    it 'ログイン状態に関わらず登録したアイテム詳細画面を確認できること' do
      visit products_path
      click_link product.title
      expect(page).to have_content('Amazonで詳しく見る')
    end
  end
  
  describe '削除機能' do
    
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
  
  describe '編集機能' do
    it '管理者は商品を編集できること' do
      sign_in_as admin_user
      visit edit_product_path(product)
      fill_in 'アイテムタイトル', with: 'アップデートアイテム'
      fill_in 'ブランドID', with: '1'
      fill_in '公式サイトのURL', with: 'officialproduct@supplebox.jp'
      click_on '更新する'
      expect(page).to have_content 'アイテムを更新しました'
      expect(page).to have_content 'アップデートアイテム'
    end
    
    it '一般ユーザーは商品を編集できないこと' do
      sign_in_as user
      visit edit_product_path(product)
      expect(page).to have_content 'プロテイン選びで失敗したくないあなたへ'
    end
  
  end
end
# frozen_string_literal: true

require 'rails_helper'

describe 'アイテム登録機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }
  let!(:product) { FactoryBot.create(:product, title: '一般アイテム') }
  let!(:other_product) { FactoryBot.create(:product, title: 'その他のアイテム') }
  let!(:brand) { FactoryBot.create(:brand) }

  describe '検索機能' do
    it 'アイテムを検索し登録できること' do
      sign_in_as user
      VCR.insert_cassette('system/api_response', match_requests_on: [Vacuum::Matcher]) do
        visit new_product_path
        fill_in 'keyword', with: 'プロテイン'
        click_on 'アイテムを検索'
        expect(page).to have_content '口コミ評価'
        expect { click_on 'アイテム登録', match: :first }.to change { Product.count }.by(1)
        expect(page).to have_content 'アイテムを登録しました'
      end
    end
  end

  describe '詳細表示機能' do
    it 'ログイン状態に関わらず登録したアイテム詳細画面を確認できること' do
      visit products_path
      click_link product.title, match: :first
      expect(page).to have_content('Amazonで詳しく見る')
    end
  end

  describe '削除機能' do
    it '管理者はアイテムを削除できること' do
      sign_in_as admin_user
      visit products_path
      expect { click_on 'アイテム削除', match: :first }.to change { Product.count }.by(-1)
      expect(page).to have_content 'アイテムを削除しました'
    end

    it '一般ユーザーはアイテムを削除できないこと' do
      sign_in_as user
      visit products_path
      expect(page).to_not have_content 'アイテム削除'
    end
  end

  describe '編集機能' do
    it '管理者はアイテムを編集できること' do
      sign_in_as admin_user
      visit product_path(product)
      visit edit_product_path(product)
      fill_in 'アイテムタイトル', with: 'アップデートアイテム'
      fill_in '公式サイトのURL', with: 'officialproduct@supplebox.jp'
      fill_in 'ブランドID', with: brand.id
      click_on '更新する'
      expect(page).to have_content 'アイテムを更新しました'
      expect(page).to have_content 'アップデートアイテム'
    end

    it '一般ユーザーはアイテムを編集できないこと' do
      sign_in_as user
      visit edit_product_path(product)
      expect(page).to have_content 'プロテイン選びで失敗したくないあなたへ'
    end
  end

  describe '一覧機能' do
    before do
      create_list(:product, 13)
    end

    it 'ユーザーはアイテム一覧を閲覧できること' do
      visit products_path
      expect(page).to have_content 'Home › アイテム一覧'
      expect(page).to_not have_content 'Home › アイテム一覧 › 1ページ目'
      expect(page).to have_selector '.pagination'
      Product.page.each do |product|
        expect(page).to have_link product.title, href: product_path(product)
      end
      within '.pagination' do
        click_link '2'
      end
      expect(page).to have_content 'Home › アイテム一覧 › 2ページ目'
      within '.breadcrumbs' do
        expect(page).to have_link 'アイテム一覧', href: products_path
      end
    end
  end
end

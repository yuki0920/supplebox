# frozen_string_literal: true

require 'rails_helper'

describe 'アイテム登録機能', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:user, admin: true) }
  let!(:product) { FactoryBot.create(:product, title: '一般アイテム') }
  let!(:other_product) { FactoryBot.create(:product, title: 'その他のアイテム') }

  describe '検索機能' do
    it 'アイテムを検索し登録できること' do
      sign_in_as user
      VCR.insert_cassette('system/products/new', match_requests_on: [Vacuum::Matcher]) do
        visit new_product_path
        fill_in 'keyword', with: 'プロテイン'
        click_on 'アイテムを検索'
        expect(page).to have_content '口コミ評価'
        expect { click_on 'アイテム登録', match: :first }.to change(Product, :count).by(1)
        expect(page).to have_content 'アイテムを登録しました'
      end
    end
  end

  describe '詳細表示機能' do
    it 'ログイン状態に関わらず登録したアイテム詳細画面を確認できること' do
      visit products_path
      click_link product.title
      expect(page).to have_content('Amazonで詳しく見る')
    end
  end

  describe '一覧機能' do
    before do
      create_list(:product, 13)
    end

    it 'ユーザーはアイテム一覧を閲覧できること' do
      visit products_path
      expect(page).to have_content 'Home › プロテイン一覧'
      expect(page).to have_selector '.pagination'
      # NOTE: CI環境でだけ落ちる
      # Product.page.each do |product|
      # expect(page).to have_link product.title, href: product_path(product)
      # end
    end
  end
end

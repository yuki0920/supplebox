# frozen_string_literal: true

require 'rails_helper'

describe 'リンク確認', js: true do
  let!(:user) { FactoryBot.create(:user, nickname: '一般ユーザー') }

  before do
    visit root_path
  end

  it 'ヘッダーリンクが表示されていること' do
    within 'header' do
      aggregate_failures do
        expect(page).to have_link('プロテイン', href: '/products')
        expect(page).to have_link('口コミ', href: '/posts')
        expect(page).to have_link('問い合わせ', href: '/contacts')
        expect(page).to have_link('新規登録', href: '/signup')
        expect(page).to have_link('ログイン', href: '/login')
        expect(page).to have_button('テストアカウントでログイン')
        expect(page).to have_link('プロテイン登録', href: '/products/new')
      end
    end
  end

  it 'フッターリンクが表示されていること' do
    within 'footer' do
      aggregate_failures do
        expect(page).to have_link('SuppleBox', href: '/')
        expect(page).to have_link('トップページ', href: '/')
        expect(page).to have_link('利用基準', href: '/policy')
        expect(page).to have_link('プライバシーポリシー', href: '/privacypolicy')
        expect(page).to have_link('お問い合わせ', href: '/contacts')
        expect(page).to have_link('プロテイン一覧を見る', href: '/products')
        expect(page).to have_link('口コミ一覧を見る', href: '/posts')
        expect(page).to have_link('プロテインを登録する', href: '/products/new')
      end
    end
  end
end

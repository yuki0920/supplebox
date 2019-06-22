require 'rails_helper'


describe 'リンク確認' do
  let!(:user) { FactoryBot.create(:user, nickname: '一般ユーザー') }
  
  before do
    visit root_path
  end
  
  it 'ヘッダーリンクログイン前確認' do
    within 'header' do
      expect(page).to have_link('ランキング', href: '/rankings/like')
      expect(page).to have_link('アイテムを探す', href: '/products')
      expect(page).to have_link('ブランドを探す', href: '/brands')
      expect(page).to have_link('口コミを探す', href: '/posts')
      expect(page).to have_link('ユーザーを探す', href: '/users')
      expect(page).to have_link('新規登録', href: '/signup')
      expect(page).to have_link('ログイン', href: '/login')
    end
  end
  
  it 'ヘッダーリンクログイン後確認' do
    sign_in_as user
    within 'header' do
      expect(page).to have_link('アイテムを追加', href: '/products/new')
    end
  end
  
  it 'フッターリンクログイン前確認' do
    within 'footer' do
      expect(page).to have_link('SuppleBox', href: '/')
      expect(page).to have_link('トップページ', href: '/')
      expect(page).to have_link('利用基準', href: '/policy')
      expect(page).to have_link('プライバシーポリシー', href: '/privacypolicy')
      expect(page).to have_link('お問い合わせ', href: '/contacts')
      expect(page).to have_link('人気アイテムランキングを見る', href: '/rankings/like')
      expect(page).to have_link('アイテム一覧を見る', href: '/products')
      expect(page).to have_link('ユーザー一覧を見る', href: '/users')
    end
  end
  
  it 'フッターリンクログイン後確認' do
    sign_in_as user
    within 'footer' do
      expect(page).to have_link('アイテムを登録する', href: '/products/new')
    end
  end
end
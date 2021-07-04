# frozen_string_literal: true

require 'rails_helper'

describe '口コミ投稿機能', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user, nickname: 'その他ユーザー') }
  let(:product) { FactoryBot.create(:product) }

  describe '新規作成機能' do
    it '口コミ投稿できること' do
      sign_in_as user
      visit product_path(product)

      fill_in 'タイトル', with: 'テストタイトル'
      choose '3'
      fill_in '口コミ内容', with: 'テストコンテント'
      attach_file '口コミ画像', 'spec/images/test_normal_image.jpg'
      click_on '送信'

      expect(page).to have_content '口コミ投稿に成功しました'
      visit product_path(product)
      expect(page).to have_content 'テストタイトル'
    end
  end

  describe '一覧表示機能' do
    before do
      create(:post, user: user, product: product, content: '一般の口コミ')

      sign_in_as user
    end

    it '一覧表示に表示されること' do
      visit posts_path
      expect(page).to have_content 'テストタイトル'
    end

    it 'トップページに表示されること' do
      click_on 'トップページ'
      expect(page).to have_content 'テストタイトル'
    end

    it 'ユーザー詳細ページに表示されること' do
      visit user_path(user)
      expect(page).to have_content 'テストタイトル' # ユーザープロフィールの口コミ
    end
  end

  describe '削除機能' do
    let(:post) { create(:post, user: user, product: product) }

    before do
      sign_in_as user
    end

    it '口コミを削除できること' do
      visit edit_post_path(post)

      page.accept_confirm do
        click_on '口コミを削除する'
      end

      visit user_path(user)
      expect(page).not_to have_content post.content
    end
  end

  describe '編集機能' do
    let!(:post) { create(:post, user: user, product: product) }

    it '口コミを編集できること' do
      sign_in_as user
      visit user_path(user)

      click_on '口コミを編集'
      fill_in 'タイトル', with: 'アップデートタイトル'
      click_on '送信'

      expect(page).to have_content '口コミ編集に成功しました'

      visit user_path(user)
      expect(page).to have_content 'アップデートタイトル'
    end

    it '他のユーザーの口コミを編集できないこと' do
      sign_in_as other_user

      visit edit_post_path(post)
      expect(page).not_to have_content '口コミ編集フォーム'
      expect(page).to have_content '最新の口コミ'
    end
  end
end

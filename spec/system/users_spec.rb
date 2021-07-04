# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザー登録機能', type: :system, js: true do
  let!(:user) { FactoryBot.create(:user, nickname: '一般ユーザー') }
  let!(:other_user) { FactoryBot.create(:user, nickname: 'その他ユーザー') }
  let!(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe '新規作成機能' do
    it '新しいユーザーを作成できること' do
      visit root_path
      click_link '新規登録'

      fill_in 'ユーザー名', with: 'TestUser'
      fill_in 'メールアドレス', with: 'tester@supplebox.jp'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード(確認)', with: 'password'
      click_on '登録する'

      expect(page).to have_content 'プロフィールを編集する'
    end
  end

  describe '編集機能' do
    it 'プロフィールを編集出来ること' do
      sign_in_as user
      click_link 'プロフィールを編集する'
      attach_file 'プロフィール画像', 'spec/images/test_normal_image.jpg'
      fill_in '自己紹介', with: 'こんにちは.'
      click_on '更新する'
      expect(page).to have_content 'プロフィールの編集に成功しました'
    end

    it '他のユーザーの編集ページにはアクセスできないこと' do
      sign_in_as user
      visit edit_user_path(other_user)
      expect(page).not_to have_current_path edit_user_path(other_user)
      expect(page).to have_current_path user_path(user)
    end
  end

  describe '詳細表示機能' do
    it 'ログイン状態に関わらずユーザーが表示されること' do
      visit user_path(user)
      expect(page).to have_content user.name
    end
  end
end

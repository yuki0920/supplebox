# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザー登録機能', type: :system do
  let!(:user) { FactoryBot.create(:user, nickname: '一般ユーザー') }
  let!(:other_user) { FactoryBot.create(:user, nickname: 'その他ユーザー') }
  let!(:admin_user) { FactoryBot.create(:user, admin: true) }

  describe '新規作成機能' do
    it '新しいユーザーを作成できること' do
      expect do
        visit root_path
        click_link '新規登録'
        fill_in 'ユーザー名', with: 'TestUser'
        fill_in 'ニックネーム', with: 'テストユーザー'
        fill_in 'メールアドレス', with: 'tester@supplebox.jp'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_on '登録する'
      end.to change { User.count }.by(+1)
      expect(page).to have_content 'ユーザを登録しました。'
      expect(page).to have_content 'テストユーザー'
    end
  end

  describe '編集機能' do
    it 'プロフィールを編集出来ること' do
      visit edit_user_path(user)
      sign_in_as user
      attach_file 'プロフィール画像', 'spec/images/test_normal_image.jpg'
      fill_in '自己紹介', with: 'こんにちは.'
      click_on '更新する'
      expect(page).to have_content 'プロフィールを更新しました'
    end

    it '他のユーザーの編集ページにはアクセスできないこと' do
      sign_in_as user
      visit edit_user_path(other_user)
      expect(page).not_to have_current_path edit_user_path(other_user)
      expect(page).to have_current_path user_path(user)
    end
  end

  describe '削除機能' do
    it '管理者ユーザーは一般ユーザーのアカウントを削除できること' do
      sign_in_as admin_user
      visit user_path(user)
      expect do
        click_on 'アカウントを削除する'
      end.to change { User.count }.by(-1)
      expect(page).to have_content 'アカウントを削除しました。またのご利用をお待ちしております。'
    end

    it '管理者ユーザーは管理者ユーザーのアカウントを削除できないこと' do
      sign_in_as admin_user
      expect(page).to_not have_content 'アカウントを削除する'
    end

    it '一般ユーザーはアカウントを削除できないこと' do
      sign_in_as user
      expect(page).to_not have_content 'アカウントを削除する'
    end
  end

  describe '一覧表示機能' do
    it 'ログイン状態に関わらずユーザーが表示されること' do
      visit users_path
      expect(page).to have_content '一般ユーザー'
      click_link '一般ユーザー'
      expect(page).to have_content '一般ユーザー'
    end
  end

  describe '一覧検索機能' do
    context '一致するユーザー名が存在する場合' do
      it 'ユーザー名が表示されること' do
        visit users_path
        fill_in 'q_name_or_nickname_cont', with: user.nickname
        click_on 'ユーザーを検索'
        expect(page).to have_content user.nickname
        expect(page).to_not have_content other_user.nickname
      end
    end

    context '一致するユーザー名が存在しない場合' do
      it 'ユーザー名が表示されないこと' do
        visit users_path
        fill_in 'q_name_or_nickname_cont', with: '架空のユーザー'
        click_on 'ユーザーを検索'
        expect(page).to_not have_content user.name
        expect(page).to_not have_content other_user.name
      end
    end
  end

  describe '詳細表示機能' do
    it 'ログイン状態に関わらずユーザーが表示されること' do
      visit user_path(user)
      expect(page).to have_content user.name
    end
  end
end
